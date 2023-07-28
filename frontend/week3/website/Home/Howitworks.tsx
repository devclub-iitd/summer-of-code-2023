import signup from './homeasset/signup1.png'
import {
    Link
}
from 'react-router-dom'
import verified from './homeasset/verified1.png'
import enjoy from './homeasset/enjoy1.png'

export default function How() {
    return(
        <div className="container-fluid mt-2 pt-3 pb-2 text-center text-white" style={{backgroundColor: '#139da4', fontFamily: 'Inria Serif; font-size: larger', textShadow: '1px 0px 1px #161616'}}>
            <h3><b>HOW IT WORKS?</b></h3>
            <div className="row">
                <div className="col-sm-4 text-center">
                    <img src={signup} className="d-block w-50 mx-auto"alt="signup"/>
                    <hr className="hr hr-blurry ms-4 me-4 border-3"/>
                    <h4 style={{textShadow: '1px 0px 1px #161616',fontFamily: 'Inika'}}><b>SIGN-UP!</b></h4>
                    <p style={{textShadow: '0px 0px 1px #161616'}}>Create your very own account and become a member. <br/>
                    <Link to='/Login' className='btn btn-warning'>LOGIN/SIGNUP</Link></p>
                </div>
                <div className="col-sm-4 text-center">
                    <img src={verified} className="d-block w-50 mx-auto"alt="verify"/>
                    <hr className="hr hr-blurry ms-4 me-4 border-3"/>
                    <h4 style={{textShadow: '1px 0px 1px #161616',fontFamily: 'Inika'}}><b>GET VERIFIED!</b></h4>
                    <p style={{textShadow: '0px 0px 1px #161616'}}>Get authenticated to avail special benefits and offers.<br/>
                    (only for verified members) </p>
                </div>
                <div className="col-sm-4 text-center">
                    <img src={enjoy} className="d-block w-50 mx-auto"alt="enjoy"/>
                    <hr className="hr hr-blurry ms-4 me-4 border-3"/>
                    <h4 style={{textShadow: '1px 0px 1px #161616',fontFamily: 'Inika'}}><b>ENJOY <em>Ec</em>!</b></h4>
                    <p style={{textShadow: '0px 0px 1px #161616'}}>You can now buy, sell, rent, deliver and receive books of your choice and needs, with guaranteed quick and seamless experience.</p>
                </div>
            </div>
        </div> 
    );
}