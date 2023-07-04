import React from "react";
export default function Landing() {
  return (<>
    <div class="row">
      <div class="col">
        <div class="p-2" id="page1home">
          <div class="row justify-content-center align-items-center">
            <span class="col d-flex flex-row-reverse">
              <div class="d-flex center p-3" id="box1">
                <img
                  src={
                    require("./images/dashicons_arrow-left-alt2.svg").default
                  }
                />
              </div>
            </span>
            <span class="col" id="pg1img">
              <img
                src={require("./images/beauty-4993469_1280-removebg-preview 1.png")}
                alt="Image not Found"
              />
            </span>
            <span class="col">
              <div class="d-flex center p-3" id="box2">
                <img
                  src={
                    require("./images/dashicons_arrow-left-alt21.svg").default
                  }
                />
              </div>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div class="container-fluid" id="page2">
          <div class="row p-4">
            <div class="col-lg-7">
              <div class="container-fluid p-0.5" id="page2LH">
                <div class="row p-4 my-5">
                  <span id="whatwedotext">
                    What we do to help our customers in digital era.
                  </span>
                </div>
                <div class="row justify-content-end">
                  <div id="receive">
                    <div class="row">
                      <img id="receiveimg" src={require("./images/imgy.svg").default} />
                    </div>
                    <div class="row">
                      <span id="receivetext"> Receive </span>
                    </div>
                    <div class="row">
                      <span id="text"
                        >Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua.
                      </span>
                    </div>
                    <div class="row">
                      <span class="col" id="LearnMore"> Learn More </span>
                      <span class="col" id="LearnMoreImg"
                        ><img src={require("./images/ic_arrow_forward_24px.svg").default}
                      /></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-auto">
              <div class="container-fluid p-3" id="page2RH">
                <div class="row justify-content-start">
                  <div class="p-2 m-2" id="send">
                    <div class="row">
                      <img id="sendimg" src={require("./images/imgx.svg").default} />
                    </div>
                    <div class="row"><span id="sendtext"> Send </span></div>
                    <div class="row">
                      <span id="text"
                        >Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua.
                      </span>
                    </div>
                    <div class="row">
                      <span class="col" id="LearnMore"> Learn More </span>
                      <span class="col" id="LearnMoreImg"
                        ><img src={require("./images/ic_arrow_forward_24px.svg").default}
                      /></span>
                    </div>
                  </div>
                </div>
                <div class="row justify-content-start">
                  <div class="p-2 m-2" id="buy">
                    <div class="row">
                      <img id="receiveimg" src={require("./images/imgz.svg").default} />
                    </div>
                    <div class="row"><span id="buytext"> Buy </span></div>
                    <div class="row">
                      <span id="text"
                        >Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua.
                      </span>
                    </div>
                    <div class="row">
                      <span class="col" id="LearnMore"> Learn More </span>
                      <span class="col" id="LearnMoreImg"
                        ><img src={require("./images/ic_arrow_forward_24px.svg").default}
                      /></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div></>
  );
}
