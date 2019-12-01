// ADD REVIEW AJAX
document.addEventListener('DOMContentLoaded', () => {
    let form = document.getElementById('review_form');
    let path = window.location.pathname;
    let pathOrigin = window.location.origin;
    let user_id = parseInt(path.split('/')[2]);
    let booking_id = parseInt(path.split('/')[4]);
    let reviewee
    
    if(booking_id){
        axios.get(`/find-booking/${booking_id}`, {headers: {'Accept': 'application/json'}})
        .then((d) => {
            reviewee = parseInt(d.data.user_booked)
            console.log(reviewee) 
        })
        .catch((e) => console.log(e))
    }

    console.log(window.location)

      
    
    form.addEventListener('submit', (e) => {
        e.preventDefault();

        
        let reviewStars = document.getElementById('review_review_stars').value;
        let reviewDetails = document.getElementById('review_details').value;
        

        axios.post(
            `/users/${user_id}/reviews`, 
            {
                reviewee : reviewee,
                review_content: reviewDetails,
                review_stars: reviewStars
            },
            {
                headers: {
                    'Content-Type': 'application/json'
                }
            }     
        )
        .then((response) => {
            if(response.status == 200) {
                window.location.href = pathOrigin + `/users/${user_id}/dashboard`
            }
        })
        .catch((e) => {
            console.log(e)
        })
        // axios.post('http://localhost:3000/findMovie', {

        // } /* <-- this guy */, {
        //     headers: {
        //     'Content-Type': 'application/json',
        //     'Access-Control-Allow-Origin': '*'
        //     },
        //     params: searchTerm
        // });
    })
})