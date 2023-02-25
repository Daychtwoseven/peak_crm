"use strict";

// Class definition
var KTSigninGeneral = function() {
    // Elements
    var form;
    var submitButton;
    var validator;

    // Handle form
    var handleValidation = function(e) {
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validator = FormValidation.formValidation(
			form,
			{
				fields: {
					'username': {
                        validators: {
							notEmpty: {
								message: 'Username is required'
							}
						}
					},
                    'password': {
                        validators: {
                            notEmpty: {
                                message: 'The password is required'
                            }
                        }
                    }
				},
				plugins: {
					trigger: new FormValidation.plugins.Trigger(),
					bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.fv-row',
                        eleInvalidClass: '',  // comment to enable invalid state icons
                        eleValidClass: '' // comment to enable valid state icons
                    })
				}
			}
		);
    }

    var handleSubmitDemo = function(e) {
        // Handle form submit
        submitButton.addEventListener('click', function (e) {
            // Prevent button default action
            e.preventDefault();

            // Validate form
            validator.validate().then(function (status) {
                if (status == 'Valid') {
                    // Show loading indication
                    submitButton.setAttribute('data-kt-indicator', 'on');
                    // Disable button to avoid multiple click
                    submitButton.disabled = true;
                    $.ajax({
                        type: 'POST',
                        url: '/authentication/sign-in/',
                        data: {'username': form.querySelector('[name="username"]').value, 'password': form.querySelector('[name="password"]').value, 'csrfmiddlewaretoken': form.querySelector('[name="csrfmiddlewaretoken"]').value},
                        success: (result) => {
                            setTimeout(function() {
                                // Enable button
                                submitButton.disabled = false;

                                // Show message popup. For more info check the plugin's official documentation: https://sweetalert2.github.io/
                                Swal.fire({
                                    text: "You have successfully logged in!",
                                    icon: "success",
                                    buttonsStyling: false,
                                    confirmButtonText: "Ok, got it!",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                }).then(function (result) {
                                    if (result.isConfirmed) {
                                        form.querySelector('[name="username"]').value= "";
                                        form.querySelector('[name="password"]').value= "";

                                        //form.submit(); // submit form
                                        var redirectUrl = form.getAttribute('data-kt-redirect-url');
                                        if (redirectUrl) {
                                            location.href = redirectUrl;
                                        }
                                    }
                                });
                            }, 2000);
                        },
                        error: (result) => {
                            const statusMsg = result['responseJSON']['statusMsg'];
                            submitButton.setAttribute('data-kt-indicator', 'off');
                            submitButton.disabled = false;
                            Swal.fire({
                                text: statusMsg,
                                icon: "error",
                                buttonsStyling: false,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            });
                        }
                    });
                } else {
                    // Show error popup. For more info check the plugin's official documentation: https://sweetalert2.github.io/
                    Swal.fire({
                        text: "Sorry, looks like there are some errors detected, please try again.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                }
            });
		});
    }


    // Public functions
    return {
        // Initialization
        init: function() {
            form = document.querySelector('#sign_in_form');
            submitButton = document.querySelector('#sign_in_submit');

            handleValidation();
            handleSubmitDemo();
        }
    };
}();

// On document ready
KTUtil.onDOMContentLoaded(function() {
    KTSigninGeneral.init();
});
