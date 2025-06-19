
    function showSuccessMessage() {
       
        document.getElementById('successMessage').style.display = 'block';

       
        setTimeout(function () {
            document.getElementById('successMessage').style.display = 'none';
        }, 4000);
    }



  
function showErrorMessage(message) {

    document.getElementById('errorMessage').innerText = message;
    document.getElementById('errorMessage').style.display = 'block';


    setTimeout(function () {
        document.getElementById('errorMessage').style.display = 'none';
    }, 4000);
}

