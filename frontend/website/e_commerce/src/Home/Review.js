import { useState } from "react";
function Review() {
    const [Review, setReview] = useState({
      product: "soap",
      brand: "Lux",
      date: "5th June",
      person: "Amy"
    });
    return<p>I bought a {Review.product} from {Review.brand} on {Review.date} and the experience was amazing. There were a few hiccups since I wasn’t familiar with the process but {Review.person} from Customer Service Department was there to help me at every step.</p>
}
export default Review