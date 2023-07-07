import { useState } from "react";
import {data,next,prev} from './Data'

import left from "./images/dashicons_arrow-left-alt2.svg"
import right from "./images/dashicons_arrow-left-alt21.svg"
import receive_img from "./images/imgy.svg"
import send_img from "./images/imgx.svg"
import buy_img from "./images/imgz.svg"
import arrow from "./images/ic_arrow_forward_24px.svg"



export default function Landing() {
  const [carousel,set_carousel]=useState(0)
  return (<>
    <div className="row">
      <div className="col">
        <div className="p-2" id="page1home">
          <div className="d-flex flex-row justify-content- align-items-center" >
            <span className="d-flex flex-row-reverse" >
              <div className="d-flex center p-3" id="box1">
                <img
                  src={left}
                  onClick={()=>{prev(carousel,set_carousel,data);console.log(carousel)}}
                />
              </div>
            </span>
            <span className=" mb-5" id="pg1img">
              <img
                src={data[carousel]}
                alt="Image not Found"
              />
            </span>
            <span className="">
              <div className="d-flex center p-3" id="box2">
                <img
                  src={
                    right
                  }
                  onClick={()=>{next(carousel,set_carousel,data)}}
                />
              </div>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div className="row">
      <div className="col">
        <div className="container-fluid" id="page2">
          <div className="row p-4">
            <div className="col-lg-7">
              <div className="container-fluid p-0.5" id="page2LH">
                <div className="row p-4 my-5">
                  <span id="whatwedotext">
                    What we do to help our customers in digital era.
                  </span>
                </div>
                <div className="row justify-content-end">
                  <div id="receive">
                    <div className="row">
                      <img id="receiveimg" src={receive_img} />
                    </div>
                    <div className="row">
                      <span id="receivetext"> Receive </span>
                    </div>
                    <div className="row">
                      <span id="text"
                        >Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua.
                      </span>
                    </div>
                    <div className="row">
                      <span className="col" id="LearnMore"> Learn More </span>
                      <span className="col" id="LearnMoreImg"
                        ><img src={arrow}
                      /></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div className="col-lg-auto">
              <div className="container-fluid p-3" id="page2RH">
                <div className="row justify-content-start">
                  <div className="p-2 m-2" id="send">
                    <div className="row">
                      <img id="sendimg" src={send_img} />
                    </div>
                    <div className="row"><span id="sendtext"> Send </span></div>
                    <div className="row">
                      <span id="text"
                        >Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua.
                      </span>
                    </div>
                    <div className="row">
                      <span className="col" id="LearnMore"> Learn More </span>
                      <span className="col" id="LearnMoreImg"
                        ><img src={arrow}
                      /></span>
                    </div>
                  </div>
                </div>
                <div className="row justify-content-start">
                  <div className="p-2 m-2" id="buy">
                    <div className="row">
                      <img id="receiveimg" src={buy_img} />
                    </div>
                    <div className="row"><span id="buytext"> Buy </span></div>
                    <div className="row">
                      <span id="text"
                        >Lorem ipsum dolor sit amet, consectetur adipiscing
                        elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua.
                      </span>
                    </div>
                    <div className="row">
                      <span className="col" id="LearnMore"> Learn More </span>
                      <span className="col" id="LearnMoreImg"
                        ><img src={arrow}
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
