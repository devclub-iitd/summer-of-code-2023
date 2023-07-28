import LandingHome from "./Landing"
import How from "./Howitworks";
import WeDo from "./Whatwedo";
import Client from "./Clientspeaks";
export default function Home() {
    return (
        <div style={{backgroundColor:'#033a3d'}}>
            <div><LandingHome /></div>
            <div><How /></div>
            <div><WeDo /></div>
            <div><Client /></div>
        </div>
    );
} 
