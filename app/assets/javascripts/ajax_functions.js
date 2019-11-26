// ADD REVIEW AJAX
document.addEventListener('DOMContentLoaded', () => {
    let form = document.getElementById('review_form');
    let reviewStars = document.getElementById('review_review_stars').value;
    let reviewDetails = document.getElementById('review_details').value;
    let path = window.location.pathname;
    let user_id = parseInt(path.split('/')[2]);
    
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        axios.post(`/users/${user_id}/reviews`, {
            reviewee: user_id,
            review_content: reviewDetails,
            review_stars: reviewStars
        })
        .then((response) => {
            console.log(response)
        })
        .catch((e) => {
            console.log(e)
        })
    })
})