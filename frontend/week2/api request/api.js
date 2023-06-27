<!DOCTYPE html>
<html>
<head>
    <title>Repository Network Analyzer</title>
</head>
<body>
    <h1>Repository Network Analyzer</h1>
    <input type="text" id="repoInput" placeholder="Enter repository owner and name (e.g., facebook/react)">
    <button onclick="analyzeRepository()">Analyze</button>
    <div id="resultContainer"></div>

    <script>
        function analyzeRepository() {
            var repoInput = document.getElementById("repoInput").value;
            var username = "YOUR_GITHUB_USERNAME";
            var token = "YOUR_PERSONAL_ACCESS_TOKEN";
            var apiUrl = `https://api.github.com/repos/${repoInput}/network/dependencies`;

            fetch(apiUrl, {
                headers: {
                    Authorization: `Basic ${btoa(username + ":" + token)}`
                }
            })
            .then(response => response.json())
            .then(data => {
                displayResults(data);
            })
            .catch(error => {
                console.log(error);
                displayError("An error occurred while fetching data.");
            });
        }

        function displayResults(data) {
            var resultContainer = document.getElementById("resultContainer");
            resultContainer.innerHTML = "";

            if (data.length === 0) {
                resultContainer.innerHTML = "No dependencies found for the repository.";
                return;
            }

            var dependenciesList = document.createElement("ul");

            data.forEach(dependency => {
                var dependencyItem = document.createElement("li");
                dependencyItem.textContent = dependency.name;
                dependenciesList.appendChild(dependencyItem);
            });

            resultContainer.appendChild(dependenciesList);
        }

        function displayError(errorMessage) {
            var resultContainer = document.getElementById("resultContainer");
            resultContainer.innerHTML = errorMessage;
        }
    </script>
</body>
</html>

