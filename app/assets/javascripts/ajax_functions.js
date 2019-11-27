// ADD REVIEW AJAX
document.addEventListener('DOMContentLoaded', () => {
    let form = document.getElementById('review_form');
    let path = window.location.pathname;
    let pathOrigin = window.location.origin;
    let user_id = parseInt(path.split('/')[2]);

    console.log(window.location)
    
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        let reviewStars = document.getElementById('review_review_stars').value;
        let reviewDetails = document.getElementById('review_details').value;
        // axios({
        //     method: 'post',
        //     headers: {
        //         'Content-Type': 'application/json'
        //     },
        //     url: `/users/${user_id}/reviews`,
        //     data: {
        //         reviewee: user_id,
        //         review_content: reviewDetails,
        //         review_stars: reviewStars  
        //     }
        // })
        // .then((response) => {
        //     console.log(response)
        // })
        // .catch((e) => {
        //     console.log(e)
        // })

        axios.post(
            `/users/${user_id}/reviews`, 
            {
                reviewee: user_id,
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