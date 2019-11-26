document.addEventListener('DOMContentLoaded', () => {
    path = window.location.pathname;
    tutor_booked_id = parseInt(path.split('/')[2]);

    console.log(tutor_booked_id);
    axios.get(`/find-tutor/${tutor_booked_id}`, {headers: {'Accept': 'application/json'}})
        .then((d) => {
            console.log(d)  
        })
        .catch((e) => console.log(e))

})