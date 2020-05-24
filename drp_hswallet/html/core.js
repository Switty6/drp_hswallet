
function changeSpan() {
    $('#name').text('Your text here');   
}


$(document).ready(function(){
    function animation(animate){
        if (animate == false){
            $(".book-bg").animate({top: '75%'},500);
            document.getElementById("wallet-exterior").style.transform = 'rotateY(-90deg)';
            document.getElementById("wallet-interior").style.transform = 'rotateY(-89.99deg)';
        }
        else if (animate == true){
            $(".book-bg").animate({top: '95%'},500);
            document.getElementById("wallet-exterior").style.transform = 'rotateY(0deg)';
            document.getElementById("wallet-interior").style.transform = 'rotateY(0deg)';
        }
    }
    window.addEventListener('message',function(event) {
        var data = event.data;
        if (data.type === 'key'){
            if (data.status === true) {
                animation(false);
                $.post('http://drp_wallet/check', JSON.stringify({}));
                return;
            }
            else{
                animation(true);
            }
        } 
        else if (data.type === 'walletdata'){
            $("#name").text(data.name);
            $("#char-id").text(data.id);
            $("#cash").text(data.cash);
            $("#dcash").text(data.dirty);
        }
    })
})
