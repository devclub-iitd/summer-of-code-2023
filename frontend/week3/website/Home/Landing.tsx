import worldofbooks from './homeasset/worldofbooks.jpg'
import virtual from './homeasset/virlib2.jpg'
import Girl from './homeasset/Girl.jpg'
import Carousel from 'react-bootstrap/Carousel' 

export default function LandingHome() {
    return (
        <div style={{backgroundColor:'#033a3d'}}>
            <Carousel>
                <Carousel.Item interval={1500}>
                    <img src={worldofbooks} className='d-block w-80 mx-auto' alt='..'/>
                    <Carousel.Caption className='d-none d-md-block'>
                        <h5>The world of Bibliophiles!</h5>
                        <p>One-stop for your projects and/or passion.</p>
                    </Carousel.Caption>
                </Carousel.Item>
                <Carousel.Item interval={1500}>
                    <img src={virtual} className='d-block w-80 mx-auto' alt='..'/>
                    <Carousel.Caption className='d-none d-md-block'>
                        <h5>Avail the most—virtually!</h5>
                    </Carousel.Caption>
                </Carousel.Item>
                <Carousel.Item interval={1500}>
                    <img src={Girl} className='d-block w-80 mx-auto' alt='..'/>
                    <Carousel.Caption className='d-none d-md-block'>
                        <h5 className='p-2'style={{fontFamily:'monospace', backgroundColor:'black'}}><b>Start Exploring Now!</b></h5>
                    </Carousel.Caption>
                </Carousel.Item>
            </Carousel>
        </div>
    );
}
