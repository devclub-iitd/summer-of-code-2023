import { ReactComponent as CheckCircleFill } from "../Add_Product/assets/check-square-fill.svg";

async function testing(setstate) {
  await fetch("https://marketplace-1-b3203472.deta.app/")
    .then((x) => x.json())
    .then((x) => {
      console.log(x);
      setstate(x);
    });
}
async function put(formData, setstate) {
  console.log(formData);
  fetch("https://marketplace-1-b3203472.deta.app/product", {
    method: "POST",
    headers: {
      accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(formData),
  })
    .then((response) => response.json())
    .then((data) => {
      // Handle the response data
      console.log(data);
      setstate(<>
        <div
          class="alert alert-success d-flex flex-row align-items-center my-2"
          role="alert"
        >
          <svg class="bi me-2" role="img" aria-label="Success:">
            <CheckCircleFill />
          </svg>
          <div className="flex-shrink-1">Product submitted successfully</div>
        </div></>
      );
    })
    .catch((error) => {
      // Handle any errors
      console.error("Error:", error);
    });
}
async function get(setstate) {
  fetch("https://marketplace-1-b3203472.deta.app/search?skip=0&limit=100")
    .then((x) => x.json())
    .then((x) => {
      console.log(x);
      setstate(x);
    })
    .catch((reason) => {
      console.log("HI");
      setstate(["Error Loading the Page"]);
    });
}


async function update(formData, setstate) {
  console.log(formData);
  fetch("https://marketplace-1-b3203472.deta.app/product/"+formData["id"], {
    method: "PATCH",
    headers: {
      accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(formData),
  })
    .then((response) => response.json())
    .then((data) => {
      // Handle the response data
      console.log(data);
      setstate(<>
        <div
          class="alert alert-success d-flex flex-row align-items-center my-2"
          role="alert"
        >
          <svg class="bi me-2" role="img" aria-label="Success:">
            <CheckCircleFill />
          </svg>
          <div className="flex-shrink-1">Product updated successfully</div>
        </div></>
      );
    })
    .catch((error) => {
      // Handle any errors
      console.error("Error:", error);
    });
}



async function get_id(setstate,id) {
  fetch("https://marketplace-1-b3203472.deta.app/product/"+id)
    .then((x) => x.json())
    .then((x) => {
      console.log(x);
      setstate(x);
    })
    .catch((reason) => {
      console.log("HI");
      setstate({error:"Error Loading the Page"});
    });
}
async function del_id(id) {
  fetch("https://marketplace-1-b3203472.deta.app/product/"+id,{method:"DELETE"})
    .then((x) => x.json())
    .then((x) => {
      console.log("object deleted")
    })
    .catch((reason) => {
      console.log(reason)
    });
}
export{ put, testing, get,get_id,del_id,update};
