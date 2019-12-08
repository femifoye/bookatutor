// ADD REVIEW AJAX
document.addEventListener('DOMContentLoaded', () => {
    let form = document.getElementById('review_form');
    let reviewNotice = document.getElementById('review-notice');
    let path = window.location.pathname;
    let pathOrigin = window.location.origin;
    let user_id = parseInt(path.split('/')[2]);
    let booking_id = parseInt(path.split('/')[4]);
    let reviewee
    
    if(booking_id){
        axios.get(`/find-booking/${booking_id}`, {headers: {'Accept': 'application/json'}})
        .then((d) => {
            reviewee = parseInt(d.data.user_booked)
        })
        .catch((e) => console.log(e))
    }
 
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        let reviewStars = document.getElementById('reviews_review_stars').value
        let reviewDetails = document.getElementById('review_details').value
        if(reviewStars && reviewDetails) {

            
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
        } else {
            reviewNotice.classList.toggle("hide");
        }
    })
})