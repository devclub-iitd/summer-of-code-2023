import {
    Link
}
from 'react-router-dom'
export default function Register() {
    return(
        <div className='container-fluid' style={{backgroundColor:'#033a3d'}}> 
            <div className="p-3 text-center text-white" style={{backgroundColor:'#033a3d', fontFamily:'larger'}}>
                <h2 style={{textShadow:'0px 0px 2px #fff'}}>REGISTER</h2>
            </div>
            <div className='col-sm-4 mx-auto'>
                <form id='registerform'>
                    <div className='text-white-50'>USERNAME</div>
                    <input type='text' className="mt-1 mb-4 form-control" placeholder="Username (must contain min. 8 characters)" aria-label="emailid" aria-describedby="btnGroupAddon"/>
                    <div className='text-white-50'>E-MAIL ADDRESS</div>
                    <input type='emailid' className="mt-1 mb-4 form-control" placeholder="E-mail Address" aria-label="emailid" aria-describedby="btnGroupAddon"/>
                    <div className='text-white-50'>PASSWORD</div>
                    <input type='password' className="mt-1 mb-4 form-control" placeholder="Password" aria-label="password" aria-describedby="btnGroupAddon"/>
                    <div className='text-white-50'>CONFIRM PASSWORD</div>
                    <input type='password' className="mt-1 mb-4 form-control" placeholder="Confirm Password" aria-label="password" aria-describedby="btnGroupAddon"/>
                    <button type='submit'className='mt-2 mb-4 btn btn-warning'>SUBMIT</button>
                </form>
            </div>
        </div>
    );
}