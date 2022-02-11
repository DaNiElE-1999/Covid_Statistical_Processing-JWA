const fields_register = document.querySelectorAll("[data-register]");
const fields_login = document.querySelectorAll("[data-login]");
const fields_update = document.querySelectorAll("[data-update]");
const fields_country = document.querySelectorAll("[data-country]");
const fields_country_new = document.querySelectorAll("[data-new-country]");
const fields_covid_update = document.querySelectorAll("[data-update-covid]");
const fields_covid_new = document.querySelectorAll("[data-new-covid]");



const validate = (elem)=>{
        if(elem.value.length > 1){
            return true;
        }
        return false;
} 

const showLoader = (elem)=>{
    $(elem).html('<i class="fa fa-refresh fa-spin"></i>');
}
const hideLoader = (elem,text) =>{
    $(elem).html(text);
}

const Login = (e)=>{
    
    
    let validated = false;
   fields_login.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
        const prev_text = $(e).text();
       showLoader(e);
        
        data = {
            "email":fields_login[0].value,
            "password":fields_login[1].value
          }
          $.post("./login",data,function(res){
              
          }).fail(function(err){
              stat = err.status;
              console.log(stat)
              if(stat === 403){
                     alertify.error("Invalid Credentials")
                     hideLoader(e,prev_text)
              }
              else if(stat == 1000){
                 window.location.href="./dashboard"
              }
          });
    }
    else{
        alertify.error("Please Enter Credentials")
    }
}
const Register = (e)=>{
     let validated = false;
   fields_register.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
           const prev_text = $(e).text();
       showLoader(e);
        data = {
          "Fname":fields_register[0].value,
          "Lname":fields_register[1].value,
          "email":fields_register[2].value,
            "password":fields_register[3].value,
            
            
          }
          $.post("./register",data,function(res){
               
          }).fail(function(err){
              stat = err.status;
              if(stat === 500){
                     alertify.error("Email Already Exist Choose Another Email")
                        hideLoader(e,prev_text)
              }
              else if(stat == 1000){
                  window.location.href="./dashboard"
              }
          });
    }
    else{
        alertify.error("Please Enter Data")
    }
}

const update = (e)=>{
     let validated = false;
   fields_update.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
          const prev_text = $(e).text();
       showLoader(e);
        data = {
          "Fname":fields_update[2].value,
          "Lname":fields_update[3].value,
          "email":fields_update[0].value,
            "password":fields_update[1].value
            
            
          }
   
          $.post("./update",data,function(res){
           alertify.alert("Success","Successfully Updated Changes will appear on refresh",function(){
                window.location.reload();
            });
                 hideLoader(e,prev_text)
              
          });
    }
    else{
        alertify.error("Please Enter Data")
    }
}

const Delete = (e)=>{
       const prev_text = $(e).text();
       showLoader(e);
       
       $.post("./delete-country",{"iso_code":$(e).attr("id")},function(res){
          alertify.alert("Success","Deleted",function(){
              window.location.reload();
          }) 
       });
       
}
const Update = (e)=>{
       const prev_text = $(e).text();
       showLoader(e);
       
       $.post("./getCountry",{"iso_code":$(e).attr("id")},function(res){
           let r =res.split(":")
           $(fields_country[0]).val(r[0])
           $(fields_country[1]).val(r[1])
           $("#triggerModal").trigger("click");
           hideLoader(e,prev_text);
       })
}
const SaveC = (e)=>{
     let validated = false;
   fields_country.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
           const prev_text = $(e).text();
       showLoader(e);
        data = {
          "iso_code":fields_country[0].value,
          "location":fields_country[1].value
          
          }
          $.post("./save-country",data,function(res){
              hideLoader(e,prev_text);
           alertify.alert("Success","Updated",function(){
              window.location.reload();
          }) 
          });
    }
    else{
        alertify.error("Please Enter Data")
    }
}

const DeleteD = (e)=>{
     const prev_text = $(e).text();
       showLoader(e);
       let f = {
           "iso":$(e).attr("id").split(":")[0],
           "date":$(e).attr("id").split(":")[1]
       }
       $.post("./delete-data",f,function(res){
          alertify.alert("Success","Deleted",function(){
              window.location.reload();
          }) 
       });
}

const UpdateD = (e) =>{
     const prev_text = $(e).text();
       showLoader(e);
       let f = {
           "iso":$(e).attr("id").split(":")[0],
           "date":$(e).attr("id").split(":")[1]
       }
       $.post("./get-covid-data",f,function(res){
          
           let v = res.split(",");
           console.log(v);
         $(fields_covid_update[0]).val(v[0]);
         $(fields_covid_update[1]).val(v[1]);
         $(fields_covid_update[2]).val(v[2]);
         $(fields_covid_update[3]).val(v[3]);
         $(fields_covid_update[4]).val(v[4]);
         $(fields_covid_update[5]).val(v[5]);
         hideLoader(e,prev_text);
         $("#triggerModalU").trigger("click");
         
       })
}
const UpdateCD = (e)=>{
     let validated = false;
   fields_covid_update.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
          const prev_text = $(e).text();
       showLoader(e);
        data = {
          "iso":fields_covid_update[0].value,
          "date":fields_covid_update[1].value,
          "loc":fields_covid_update[2].value,
            "death":fields_covid_update[3].value,
            "case":fields_covid_update[4].value,
            "vacc":fields_covid_update[5].value
            
            
          }
   
          $.post("./update-covid-date",data,function(res){
           alertify.alert("Success","Successfully Updated Changes will appear on refresh",function(){
                window.location.reload();
            });
                 hideLoader(e,prev_text)
              
          });
    }
    else{
        alertify.error("Please Enter Data")
    }
}
const AddCD =(e)=>{
       let validated = false;
   fields_covid_new.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
           const prev_text = $(e).text();
       showLoader(e);
        data = {
          "iso":fields_covid_new[0].value,         
           "loc":fields_covid_new[1].value,
           "death":fields_covid_new[3].value,
           "cases":fields_covid_new[2].value,
           "vacc":fields_covid_new[4].value                  
          }
          $.post("./add-data",data,function(res){
              hideLoader(e,prev_text);
          
             if(res != "200"){
                 console.log(res);
                    alertify.alert("Error","Country Not Exists");
              }else{
              
                alertify.alert("Success","Added",function(){
                   window.location.reload();
               }) 
              }
          });
    }
    else{
        alertify.error("Please Enter Data")
    }
}
const AddC = (e)=>{
        let validated = false;
   fields_country_new.forEach(elem=>{
        validated  = validate(elem)
   });
   
    if(validated){
           const prev_text = $(e).text();
       showLoader(e);
        data = {
          "iso":fields_country_new[0].value,
          "loc":fields_country_new[1].value
          
          }
          $.post("./add-country",data,function(res){
              console.log(res);
              hideLoader(e,prev_text);
           alertify.alert("Success","Added",function(){
              window.location.reload();
          }) 
          });
    }
    else{
        alertify.error("Please Enter Data")
    }
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};

const byCont = ()=>{
        var a = prompt("Enter Continent :","");
        if(a == "" || a==null || a.length == 0){
            byCont();
        }
          window.location.href = "./analysis?f=c&v="+encodeURIComponent(a)
}
const byList = ()=>{
        var a = prompt("Enter Multiple Countries Comma Seperated :","");
        if(a == "" || a==null || a.length == 0){
            byList();
        }
          window.location.href = "./analysis?f=l&v="+encodeURIComponent(a)
}
var link = document.createElement('link'); 
  
        // set the attributes for link element
           link.rel = 'stylesheet'; 
      
        link.type = 'text/css';
      
        link.href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"; 
  
        // Get HTML head element to append 
        // link element to it 
        document.getElementsByTagName('head')[0].appendChild(link); 
  

