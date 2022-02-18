function match_password()
{
    
    let con_pass = document.getElementById('cnfrm_password').value;
    let pass = document.getElementById('password').value;

    if ( pass === '' || con_pass === '' ) {
        document.getElementById("error_password").innerHTML = "Both Passwords Do not Match";
        return false;
    }
    
    if(pass === con_pass)
    {
        document.getElementById("error_password").innerHTML = "";
       return true;
    }
    else
    {
        document.getElementById("error_password").innerHTML = "Both Passwords Do not Match";
        return false;
    }
    
}

function printNumber(event)
{
    var keychar;
    
    keychar = event.key;
    // alphas and numbers
    if (((".+-0123456789").indexOf(keychar) > -1))
    {   
        return true;
    }
    else
    {
        return false;
    }
}


function validate_form()
{
    let name = true;
    let email = true;
    let password = true;
    let cnfrm = true;
    let phone = true;
    let address = true;
    let gender = true;

    if(document.getElementById('userName').value =='')
    {
        name = false;
        document.getElementById('error_name').innerHTML = "Input User Name";
    }
    else
    {
        document.getElementById('error_name').innerHTML = "";
    }

    if(document.getElementById('email').value =='')
    {
        email = false;
        document.getElementById('error_email').innerHTML = "Input Email";
    }
    else
    {
        if(document.getElementById('email').value.indexOf('@') > 0 && (document.getElementById('email').value.lastIndexOf('.')+1) < document.getElementById('email').value.length && document.getElementById('email').value.lastIndexOf('.') > (document.getElementById('email').value.lastIndexOf('@')+1) && document.getElementById('email').value.indexOf('.'))
        {
            email = true;
            document.getElementById('error_email').innerHTML = "";
        }
        else
        {
            email = false;
            document.getElementById('error_email').innerHTML = "Email not Valid";
        }
    }

    if(document.getElementById('password').value == '')
    {
        password = false;
        document.getElementById('error_password').innerHTML = 'Input Password';
    }
    else
    {
        document.getElementById('error_password').innerHTML = '';
    }
    
    if(document.getElementById('cnfrm_password').value == '')
    {
        cnfrm = false;
        document.getElementById('error_password').innerHTML = 'Input Both Password Fields';
    }
    else
    {
        document.getElementById('error_password').innerHTML = '';
    }
    if(document.getElementById("gender-male").checked || document.getElementById("gender-female").checked)
    {
        document.getElementById('error_gender').innerHTML = '';
    }
    else
    {
        gender = false;
        document.getElementById('error_gender').innerHTML = 'Select Gender';
    }
    if(document.getElementById('phone').value == '')
    {
        phone = false;
        document.getElementById('error_phone').innerHTML = 'Input Phone Number';
    }
    else
    {
        document.getElementById('error_phone').innerHTML = '';
    }   
    if(document.getElementById('address').value == '')
    {
        address = false;
        document.getElementById('error_address').innerHTML = 'Input Address';
    }
    else
    {
        document.getElementById('error_address').innerHTML = '';
    }

    if(name == true && email == true && password == true && cnfrm && phone == true && address == true && gender == true)
    {
        return true;
    }
    else
    {
        return false;
    }

} 

function validate_details()
{
    let name = true;
    let phone = true;
    let address = true;
    let gender = true;

    if(document.getElementById('userName').value =='')
    {
        name = false;
        document.getElementById('error_name').innerHTML = "Input User Name";
    }
    else
    {
        document.getElementById('error_name').innerHTML = "";
    }
    if(document.getElementById("gender-male").checked || document.getElementById("gender-female").checked)
    {
        document.getElementById('error_gender').innerHTML = '';
    }
    else
    {
        gender = false;
        document.getElementById('error_gender').innerHTML = 'Select Gender';
    }
    if(document.getElementById('phone').value == '')
    {
        phone = false;
        document.getElementById('error_phone').innerHTML = 'Input Phone Number';
    }
    else
    {
        document.getElementById('error_phone').innerHTML = '';
    }   
    if(document.getElementById('address').value == '')
    {
        address = false;
        document.getElementById('error_address').innerHTML = 'Input Address';
    }
    else
    {
        document.getElementById('error_address').innerHTML = '';
    }

    if(name == true && phone == true && address == true && gender == true)
    {
        return true;
    }
    else
    {
        return false;
    }

} 

function validate_login()
{
	let email = true;
	let password = true;
	
	if(document.getElementById('email').value =='')
    {
        email = false;
        document.getElementById('error_email').innerHTML = "Input Email";
    }
	else
	{
		document.getElementById('error_email').innerHTML = "";
	}
	if(document.getElementById('password').value =='')
    {
        email = false;
        document.getElementById('error_password').innerHTML = "Input Password";
    }
	else
	{
		document.getElementById('error_password').innerHTML = "";
	}
	
	if(email == true && password == true)
	{
		return true;
	}
	else
	{
		return false;
	}
	
}

function email_validator()
{
	let email = true;
	if(document.getElementById('email').value =='')
    {
        email = false;
        document.getElementById('error_email').innerHTML = "Input Email";
    }
    else
    {
        if(document.getElementById('email').value.indexOf('@') > 0 && (document.getElementById('email').value.lastIndexOf('.')+1) < document.getElementById('email').value.length && document.getElementById('email').value.lastIndexOf('.') > (document.getElementById('email').value.lastIndexOf('@')+1) && document.getElementById('email').value.indexOf('.'))
        {
            email = true;
            document.getElementById('error_email').innerHTML = "";
        }
        else
        {
            email = false;
            document.getElementById('error_email').innerHTML = "Email not Valid";
        }
    }
	
	if(email == true)
	{
		return true;
	}
	else
	{
		return false;
	}
}





            