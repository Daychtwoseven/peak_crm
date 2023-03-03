"use strict";
var KTModalCustomersAdd = (function () {
    var t, e, o, n, r, i;
    return {
        init: function () {
            (i = new bootstrap.Modal(document.querySelector("#addCustomerModal"))),
                (r = document.querySelector("#addCustomerForm")),
                (e = r.querySelector("#kt_modal_add_customer_cancel")),
                (o = r.querySelector("#kt_modal_add_customer_close")),
                e.addEventListener("click", function (t) {
                    t.preventDefault(),
                        Swal.fire({
                            text: "Are you sure you would like to cancel?",
                            icon: "warning",
                            showCancelButton: !0,
                            buttonsStyling: !1,
                            confirmButtonText: "Yes, cancel it!",
                            cancelButtonText: "No, return",
                            customClass: { confirmButton: "btn btn-primary", cancelButton: "btn btn-active-light" },
                        }).then(function (t) {
                            t.value
                                ? (r.reset(), i.hide())
                                : "cancel" === t.dismiss && Swal.fire({ text: "Your form has not been cancelled!.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn btn-primary" } });
                        });
                }),
                o.addEventListener("click", function (t) {
                    t.preventDefault(),
                        Swal.fire({
                            text: "Are you sure you would like to cancel?",
                            icon: "warning",
                            showCancelButton: !0,
                            buttonsStyling: !1,
                            confirmButtonText: "Yes, cancel it!",
                            cancelButtonText: "No, return",
                            customClass: { confirmButton: "btn btn-primary", cancelButton: "btn btn-active-light" },
                        }).then(function (t) {
                            t.value
                                ? (r.reset(), i.hide())
                                : "cancel" === t.dismiss && Swal.fire({ text: "Your form has not been cancelled!.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn btn-primary" } });
                        });
                });
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTModalCustomersAdd.init();
});


$(document).ready(function(){
    // Format options
    var optionFormat = function(item) {
       if ( !item.id ) {
           return item.text;
       }
       var span = document.createElement('span');
       var imgUrl = item.element.getAttribute('data-kt-select2-img');
       var template = '';

       template += '<img src="' + imgUrl + '" class="rounded-circle h-20px me-2" alt="image"/>';
       template += item.text;

       span.innerHTML = template;

       return $(span);
    }

    // Init Select2 --- more info: https://select2.org/
    $('select[name=manager]').select2({
       templateSelection: optionFormat,
       templateResult: optionFormat
    });

    $('select[name=setter]').select2({
       templateSelection: optionFormat,
       templateResult: optionFormat
    });

    $('select[name=closer]').select2({
       templateSelection: optionFormat,
       templateResult: optionFormat
    });

    $('select[name=people]').select2({
       templateSelection: optionFormat,
       templateResult: optionFormat
    });

    $('#addCustomerForm').on('submit', (e) => {
        e.preventDefault();
        Swal.fire({
            text: "Are you sure you would like to add?",
            icon: "warning",
            showCancelButton: !0,
            buttonsStyling: !1,
            confirmButtonText: "Yes, add it!",
            cancelButtonText: "No, return",
            customClass: { confirmButton: "btn btn-primary", cancelButton: "btn btn-active-light" },
        }).then((result) => {
            if(result['isConfirmed']){
                 $('#addCustomerSubmitBtn').attr('data-kt-indicator', 'on').attr('disabled', true);
                 const formData = new FormData();
                 formData.append("name", $(e.target).find("input[name=name]").val())
                 formData.append("email", $(e.target).find("input[name=email]").val())
                 formData.append("phone", $(e.target).find("input[name=phone]").val())
                 formData.append("address", $(e.target).find("input[name=address]").val())
                 formData.append("state", $(e.target).find("input[name=state]").val())
                 formData.append("previous_company", $(e.target).find("input[name=previous_company]").val())
                 formData.append("sold_with", $(e.target).find("input[name=sold_with]").val())
                 formData.append("ss", $(e.target).find("input[name=ss]").val())
                 formData.append("finance_company", $(e.target).find("input[name=finance_company]").val())
                 formData.append("number_of_panels", $(e.target).find("input[name=number_of_panels]").val())
                 formData.append("contract_signed_date", $(e.target).find("input[name=contract_signed_date]").val())
                 formData.append("kw", $(e.target).find("input[name=kw]").val())
                 formData.append("project_cost", $(e.target).find("input[name=project_cost]").val())
                 formData.append("manager", $(e.target).find("select[name=manager]").val())
                 formData.append("setter", $(e.target).find("select[name=setter]").val())
                 formData.append("closer", $(e.target).find("select[name=closer]").val())
                 formData.append("csrfmiddlewaretoken", $(e.target).find("input[name=csrfmiddlewaretoken]").val())

                 let front_of_house = $(e.target).find("input[name=front_of_house]").map(function() {
                        formData.append("front_of_house", this.files[0])
                 });

                 let panel_layout = $(e.target).find("input[name=panel_layout]").map(function() {
                        formData.append("panel_layout", this.files[0])
                 });

                 let people = $(e.target).find("select[name=people]").select2("val").map(function(data){
                        formData.append("people", data)
                 });

                 $.ajax({
                     type: 'POST',
                     url: '/customers/add/',
                     data: formData,
                     contentType: false,
                     processData: false,
                     success: (result) => {
                         const statusMsg = result['statusMsg'];
                         Swal.fire({
                             text: statusMsg,
                             icon: "success",
                             buttonsStyling: false,
                             confirmButtonText: "Close",
                             customClass: {
                                 confirmButton: "btn btn-primary"
                             }
                         }).then(() => {
                             $('#addCustomerSubmitBtn').attr('data-kt-indicator', 'off').attr('disabled', false);
                             $(e.target).find("select[name=manager]").val('').trigger('change')
                             $(e.target).find("select[name=setter]").val('').trigger('change')
                             $(e.target).find("select[name=closer]").val('').trigger('change')
                             $(e.target).find("select[name=people]").val('').trigger('change')
                             $('#addCustomerForm').trigger('reset');
                         });
                     },
                     error: (result) => {
                         const statusMsg = result['responseJSON']['statusMsg'];
                         Swal.fire({
                             text: statusMsg,
                             icon: "error",
                             buttonsStyling: false,
                             confirmButtonText: "Ok, got it!",
                             customClass: {
                                 confirmButton: "btn btn-primary"
                             }
                         }).then(() => {
                             $('#addCustomerSubmitBtn').attr('data-kt-indicator', 'off').attr('disabled', false);
                         });
                     }
                 });
            }
        });
    });
});
