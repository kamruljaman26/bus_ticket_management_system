// Check From Validation
function validateForm() {
    let password = document.getElementById("password").value;
    let con_password = document.getElementById("con_password").value;

    if (password !== con_password) {
        alert("Password not matched!")
        return false
    } else {
        return true
    }
}