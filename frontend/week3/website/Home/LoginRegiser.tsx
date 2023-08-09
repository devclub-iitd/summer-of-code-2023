import {
    Link
}
from 'react-router-dom'
export default function Login() {
    return (
        <div className='container-fluid' style={{backgroundColor:'#033a3d'}}> 
            <div className="p-3 text-center text-white" style={{backgroundColor:'#033a3d', fontFamily:'larger'}}>
                <h2 style={{textShadow:'0px 0px 2px #fff'}}>LOGIN</h2>
            </div>
            <div className='col-sm-4 mx-auto'>
                <form id='loginform'>
                    <input type='emailid' className="mt-1 mb-4 form-control" placeholder="E-mail Address" aria-label="emailid" aria-describedby="btnGroupAddon"/>
                    <input type='password' className="mt-1 form-control" placeholder="Password" aria-label="password" aria-describedby="btnGroupAddon"/>
                    <button type='submit'className='mt-4 mb-4 btn btn-warning'>SUBMIT</button>
                </form>
                <div className='text-white text-center' style={{fontFamily:'larger'}}>
                    Not a member? <Link to='/Register' className='link-warning text-decoration-none'>REGISTER</Link>
                </div>
                <div className='mt-4 mb-2 text-white text-center' style={{fontFamily:'larger'}}>
                    Or sign up with:
                </div>
                <div className='pb-3 text-white text-center'>
                    <a className="btn" style={{color:'white'}} href="LoginwithGoogle" role="button">
                        <i className="bi bi-google"></i>
                    </a>
                    <a className="btn" style={{color:'white'}} href="LoginwithFacebook" role="button">
                        <i className="bi bi-facebook"></i>
                    </a>
                    <a className="btn" style={{color:'white'}} href="LoginwithGithub" role="button">
                        <i className="bi bi-github"></i>
                    </a>
                    <a className="btn" style={{color:'white'}} href="LoginwithEmail" role="button">
                        <i className="bi bi-envelope-fill"></i>
                    </a>
                </div>
            </div>
        </div>
    );
}