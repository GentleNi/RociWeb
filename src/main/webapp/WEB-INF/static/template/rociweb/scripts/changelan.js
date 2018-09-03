
/*var lan="${language}";
if(lan == "zh-CN"){
    $(".zh").addClass("active-lang");
}else{
    $(".en").addClass("active-lang");
}*/

$(".lang").click(function(){
    var lan ;
    if($(this).hasClass("zh")){
        lan = "zh";
    } else if($(this).hasClass("en")){
        lan = "en";
    }
    $.ajax({
        url:'${BASE_PATH}/change_lan.json',
        type:'POST',
        data:{
            lan:lan
        },
        timeout:5000,
        dataType:'json',
        success:function(result){
            if(result.result){
                window.location.reload();
            }
        }

    });
});
