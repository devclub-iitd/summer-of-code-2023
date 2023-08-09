import image1 from './homeasset/image1.png'
import image2 from './homeasset/image2.png'
import image3 from './homeasset/image3.png'
import {
    Link
}
from 'react-router-dom'

export default function WeDo() {
    return (
        <div className="container-fluid p-2" style={{backgroundColor: "rgb(202, 243, 243)",background: "linear-gradient(180deg, #c3eaec 0.52%, rgb(176, 239, 239) 100%)"}}>
            <div className="col-sm-6 ms-1 text-center">
                <h1 className="p-5" style={{fontFamily: "Georgia, 'Times New Roman', Times, serif", textShadow: '1px 0px 1px#161616'}}>What we do in this <br/>
                    Digital Era?</h1>
            </div>
            <div className="pe-5 col-sm-6 ms-auto"> 
                <div className="container p-3 text-center" style={{backgroundColor: 'azure', boxShadow: '10px 10px 10px 10px rgba(3, 58, 81, 0.25)'}}>
                    <img src={image1} className="d-block w-50 mx-auto"alt="buyrent"/>
                    <hr className="hr hr-blurry ms-5 me-5 border-1"/>
                    <h2 className="p-2 pb-1" style={{fontFamily: "Georgia, 'Times New Roman', Times, serif", textShadow: '1px 0px 1px#161616'}}>BUY OR RENT!<br/></h2>
                    <p className="p-3 pt-1" style={{fontFamily:"'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"}}>Dwelve into the world of books, magazines and all other written forms of information, fellow bibliophiles!<br/>
                    Browse through and BUY or RENT according to your needs. Ec offers verified members limited edition offers to avail books or magazines in our premium library.<br/><br/>
                    <Link to='/ShoppingPlatform' className='btn btn-warning' style={{fontFamily: "'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"}}>LEARN MORE</Link></p>
                </div>
            </div>
            <div className="ps-5 col-sm-6">
                <div className="container p-3 text-center"style={{backgroundColor: 'azure', boxShadow: '10px 10px 10px 10px rgba(3, 58, 81, 0.25)'}} >
                    <img src={image2} className="d-block w-50 mx-auto"alt="sell"/>
                    <hr className="hr hr-blurry ms-5 me-5 border-1"/>
                    <h2 className="p-2 pb-1" style={{fontFamily: "Georgia, 'Times New Roman', Times, serif", textShadow: '1px 0px 1px#161616'}}>SELL & RECEIVE!<br/></h2>
                    <p className="p-3 pt-1" style={{fontFamily:"'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"}}>Through <i>Ec</i>, you can download your required written material in online or even get it delivered right at your doorstep.<br/>
                    Verified members can also SELL or UPLOAD authenticated word documents in online formats or put it up for sale on BUY or RENT basis. Vouchers and offers available for every exchange too! <br/> (Only for Verified Members)<br/><br/>
                    <Link to='/ShoppingPlatform' className='btn btn-warning' style={{fontFamily: "'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"}}>LEARN MORE</Link></p>
                </div>
            </div>
            <div className="pe-5 col-sm-6 ms-auto"> 
                <div className="container p-3 text-center" style={{backgroundColor: 'azure', boxShadow: '10px 10px 10px 10px rgba(3, 58, 81, 0.25)'}}>
                    <img src={image3} className="d-block w-50 mx-auto"alt="happy"/>
                    <hr className="hr hr-blurry ms-5 me-5 border-1"/>
                    <h2 className="p-2 pb-1" style={{fontFamily: "Georgia, 'Times New Roman', Times, serif", textShadow: '1px 0px 1px#161616'}}>HAPPY READING!<br/></h2>
                    <p className="p-3 pt-1" style={{fontFamily:"'Segoe UI', Tahoma, Geneva, Verdana, sans-serif"}}>Choose your read with the available preview of the first few pages to enhance your reading experience!<br/>
                    With quick and seamless transaction experience, immerse yourself into <i>Ec</i> - be it for fulfilling your hobby, completing your project, clearing your rack or getting limited online access to otherwise unavailable documents in your area.<br/><br/>
                    <Link to='/ShoppingPlatform' className='btn btn-warning' style={{fontFamily: "'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"}}>LEARN MORE</Link></p>
                </div>
            </div>
        </div>
    );
}