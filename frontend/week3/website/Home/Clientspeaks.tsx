import quote from './homeasset/quote.png'
import clientpic from './homeasset/clientpic.png'
import johndoe from './homeasset/Subject.png'
import arrow1 from './homeasset/arrow1.png'
import arrow2 from './homeasset/arrow2.png'
import { useState } from 'react'

function Review() {
    const [review,setReview] = useState ({
        book:"'Ikigai'",
        publisher:'Penguin Life',
        date:'5th July',
        person:'Amy',
        message:'Lovely Platform! Will surely recommend!',
        client :'JAHNABI ROY',
        source: clientpic,
        qualification:'Student, IIT Delhi'
    })

    return (
        <div className='container-fluid' style={{backgroundColor:"#033a3d"}}>
            <h1 className="p-2 text-center text-white" style={{textShadow: '1px 0px 1px #fff'}}><b>WHAT OUR CLIENTS SAY ?</b></h1>
            <div className="row">
                <div className="pt-3 col-sm-5">
                    <div className="container p-3" style={{backgroundColor: 'rgb(172, 214, 216)', boxShadow: '12px 12px#fff'}}>
                        <img src={review.source} className="d-block w-50 mx-auto"alt="client"/>
                        <h4 className="mt-2 text-black text-center" style={{textShadow: '1px 0px 1px #033a3d'}}>— {review.qualification}</h4>
                    </div>
                </div>
                <div className="pt-4 col-sm-6 ms-auto text-end">
                    <img src={quote} className="d-block me-auto"/>
                    <p className="text-white p-4" style={{fontFamily:'monospace'}}>
                        <i>{review.message}</i><br/> I bought {review.book} from {review.publisher} on {review.date} and the experience was amazing. There were a few hiccups since I wasn't familiar with the process but {review.person} from Customer Service Department was there to help me at every step.<br/><br/>
                    <strong style={{fontSize: "larger"}}>{review.client}</strong></p>
                    <div className='row'>
                        <div className='col-sm-2'>
                            <img src={arrow1} className='p-2 d-block w-80' alt=''
                            onClick={() => setReview({
                                book:"'Ikigai'",
                                publisher:'Penguin Life',
                                date:'5th July',
                                person:'Amy',
                                message:'Lovely Platform! Will surely Recommend!',
                                client:'JAHNABI ROY',
                                source:clientpic,
                                qualification:'Student, IIT Delhi'
                            })}/>
                        </div>
                        <div className='p-2 col-sm-2 ms-auto'>
                            <img src={arrow2} className='d-block w-80' alt=''
                            onClick={() => setReview({
                                book:"'What Got You Here Won't Get You There'",
                                publisher:'Profile Books',
                                date:'18th July',
                                person:'Chandler',
                                message:'Great Ideation! Super Helpful!',
                                client:'John Doe',
                                source:johndoe,
                                qualification:'Working Professinal'
                            })}/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Review;