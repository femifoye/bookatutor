

document.addEventListener('DOMContentLoaded', () => {
    const toggleForm = document.querySelector('.toggle-booking-form');
    const bookingForm = document.getElementById('book-tutor-form');

    console.log(toggleForm);
    console.log(bookingForm)

    toggleForm.addEventListener('click', (e) => {
        e.preventDefault()
        e.stopPropagation()

        bookingForm.classList.toggle('hide')
    })
})