import {useState} from "react";
import{data2,next,prev} from "./Data.js"
import xyzImage from "./images/xyz.png";
import securityImage from "./images/carbon_security.svg";
import happyEmojiImage from "./images/heroicons-outline_emoji-happy.svg";
import quoteLeftImage from "./images/fa-solid_quote-left.svg";
import arrowLeftAlt2Image from "./images/dashicons_arrow-left-alt2.svg";
import arrowLeftAlt22Image from "./images/dashicons_arrow-left-alt22.svg";
export default function HowitWorks() {
  const [carousel_review,set_carousel_review]=useState(0)
  return (
    <>
      <div className="row">
        <div className="container-fluid" id="page3">
          <div className="row">
            <div className="container" id="page3up">
              <div className="row">
                <span className="htw p-2 m-4">How it works</span>
              </div>
              <div className="row">
                <span className="col">
                  <div className="container-fluid" id="p31">
                    <div className="row justify-content-center p-4">
                      <img id="p3img1" src={xyzImage} />
                    </div>
                    <div className="row">
                      <span id="p31t1">Create an account</span>
                    </div>
                    <div className="row">
                      <span id="p3infot">
                        Lorem ipsum dolor sit amet, consecteteu.
                      </span>
                    </div>
                  </div>
                </span>
                <span className="col" id="p32">
                  <div className="container-fluid" id="p31">
                    <div className="row justify-content-center p-4">
                      <img id="p3img2" src={securityImage} />
                    </div>
                    <div className="row">
                      <span id="p31t2">Get authorization</span>
                    </div>
                    <div className="row">
                      <span id="p3infot">
                        Lorem ipsum dolor sit amet, consecteteu.
                      </span>
                    </div>
                  </div>
                </span>
                <span id="p33" className="col">
                  <div className="container-fluid" id="p31">
                    <div className="row justify-content-center p-4">
                      <img
                        id="p3img3"
                        src={happyEmojiImage}
                      />
                    </div>
                    <div className="row">
                    <span id="p31t3">Enjoy the app</span></div>
                    <div className="row pb-5">
                      <span id="p3infot">
                        Lorem ipsum dolor sit amet, consecteteu.
                      </span>
                    </div>
                  </div>
                </span>
              </div>
            </div>
          </div>
          <div className="row">
            <div className="container" id="page3down">
              <div className="row p-3 m-4">
                <span id="whatourclient"> What our clients say </span>
              </div>
              <div className="row">
                <div className="col">
                  <div className="row">
                    <div className="container-fluid"></div>
                  </div>
                </div>
                <div className="col">
                  <div className="container-fluid">
                    <div className="row">
                      <img
                        id="p4rework"
                        src={quoteLeftImage}
                      />
                    </div>
                    <div className="row">
                      <span id="p4retext">
                      {data2[carousel_review]}
                      </span>
                    </div>
                    <div className="row">
                      <span id="author">GOD</span>
                    </div>
                    <div className="row justify-content-end changesymb">
                      <div className="col">
                        <div className="row justify-content-end">
                          <span id="p4next" onClick={()=>{console.log("clicked",data2,carousel_review);prev(carousel_review,set_carousel_review,data2)}}>
                            <img src={arrowLeftAlt2Image} />
                          </span>
                        </div>
                      </div>
                      <div className="col">
                        <span id="p4prev" onClick={()=>{next(carousel_review,set_carousel_review,data2)}}>
                          <img src={arrowLeftAlt22Image}  />
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
