import React,{useState} from "react";
import Review from "./Review";
import{data2,next,prev} from "./Data.js"
export default function HowitWorks() {
  const [carousel_review,set_carousel_review]=useState(0)
  return (
    <>
      <div class="row">
        <div class="container-fluid" id="page3">
          <div class="row">
            <div class="container" id="page3up">
              <div className="row">
                <span class="htw p-2 m-4">How it works</span>
              </div>
              <div class="row">
                <span class="col">
                  <div class="container-fluid" id="p31">
                    <div class="row justify-content-center p-4">
                      <img id="p3img1" src={require("./images/xyz.png")} />
                    </div>
                    <div class="row">
                      <span id="p31t1">Create an account</span>
                    </div>
                    <div class="row">
                      <span id="p3infot">
                        Lorem ipsum dolor sit amet, consecteteu.
                      </span>
                    </div>
                  </div>
                </span>
                <span class="col" id="p32">
                  <div class="container-fluid" id="p31">
                    <div class="row justify-content-center p-4">
                      <img id="p3img2" src={require("./images/carbon_security.svg").default} />
                    </div>
                    <div class="row">
                      <span id="p31t2">Get authorization</span>
                    </div>
                    <div class="row">
                      <span id="p3infot">
                        Lorem ipsum dolor sit amet, consecteteu.
                      </span>
                    </div>
                  </div>
                </span>
                <span id="p33" class="col">
                  <div class="container-fluid" id="p31">
                    <div class="row justify-content-center p-4">
                      <img
                        id="p3img3"
                        src={require("./images/heroicons-outline_emoji-happy.svg").default}
                      />
                    </div>
                    <div class="row">
                    <span id="p31t3">Enjoy the app</span></div>
                    <div class="row pb-5">
                      <span id="p3infot">
                        Lorem ipsum dolor sit amet, consecteteu.
                      </span>
                    </div>
                  </div>
                </span>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="container" id="page3down">
              <div class="row p-3 m-4">
                <span id="whatourclient"> What our clients say </span>
              </div>
              <div class="row">
                <div class="col">
                  <div class="row">
                    <div class="container-fluid"></div>
                  </div>
                </div>
                <div class="col">
                  <div class="container-fluid">
                    <div class="row">
                      <img
                        id="p4rework"
                        src={require("./images/fa-solid_quote-left.svg").default}
                      />
                    </div>
                    <div class="row">
                      <span id="p4retext">
                      {data2[carousel_review]}
                      </span>
                    </div>
                    <div class="row">
                      <span id="author">GOD</span>
                    </div>
                    <div class="row justify-content-end changesymb">
                      <div class="col">
                        <div class="row justify-content-end">
                          <span id="p4next" onClick={()=>{console.log("clicked",data2,carousel_review);prev(carousel_review,set_carousel_review,data2)}}>
                            <img src={require("./images/dashicons_arrow-left-alt2.svg").default} />
                          </span>
                        </div>
                      </div>
                      <div class="col">
                        <span id="p4prev" onClick={()=>{next(carousel_review,set_carousel_review,data2)}}>
                          <img src={require("./images/dashicons_arrow-left-alt22.svg").default}  />
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
