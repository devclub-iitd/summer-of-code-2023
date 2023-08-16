interface ReviewProps {
  brand: string;
  date: string;
  person: string;
  product: string;
}


function Review(props:ReviewProps) {
  var { brand, date, person, product }:any = props;

  return (
    <p>
      I bought a {product} from {brand} on {date} and the experience was amazing.
      There were a few hiccups since I wasn’t familiar with the process but {person} from
      the Customer Service Department was there to help me at every step.
    </p>
  );
}

export default Review;
