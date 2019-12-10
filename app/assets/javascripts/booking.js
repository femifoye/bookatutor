

document.addEventListener('turbolinks:load', () => {
    const toggleForm = document.querySelector('.toggle-booking-form');
    const bookingForm = document.getElementById('book-tutor-form');

    toggleForm.addEventListener('click', (e) => {

        bookingForm.classList.toggle('hide')
    })
})