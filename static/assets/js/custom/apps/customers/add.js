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

const viewUpdatesBtn = (pk) => {
    const loadingEl = document.createElement("div");
    document.body.prepend(loadingEl);
    loadingEl.classList.add("page-loader");
    loadingEl.classList.add("flex-column");
    loadingEl.classList.add("bg-dark");
    loadingEl.classList.add("bg-opacity-25");
    loadingEl.innerHTML = `
        <span class="spinner-border text-primary" role="status"></span>
        <span class="text-gray-800 fs-6 fw-semibold mt-5">Loading...</span>
    `;

    // Show page loading
    KTApp.showPageLoading();

    // Hide after 3 seconds
    setTimeout(function() {
        KTApp.hidePageLoading();
        loadingEl.remove();
        $('#viewUpdatesModalContent').empty();
        $('#viewUpdatesModalContent').load(`/customers/view-updates/${pk}`)
        $('#viewUpdatesModal').modal('toggle');
    }, 2000);
}

$(document).ready(function(){
    var table = $("#kt_customers_table").DataTable();

    $("#kt_customers_table tbody select[name=td_sold_with]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_sold_with]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('sold_with') : saveUpdate(customer_id, 'sold_with', input_value, 'selection')
    });

    $("#kt_customers_table tbody input[name=td_previous_company]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_previous_company]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'previous_company', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_dob]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("input[name=td_dob]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();
        saveUpdate(customer_id, 'dob', input_value, 'input')
    });

    $("#kt_customers_table tbody input[name=td_ss]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_ss]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'ss', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_finance_company]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_finance_company]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'finance_company', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_number_of_panels]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_number_of_panels]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'number_of_panels', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_contract_signed_date]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("input[name=td_contract_signed_date]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();
        saveUpdate(customer_id, 'contract_signed_date', input_value, 'input')
    });

    $("#kt_customers_table tbody input[name=td_install_date]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("input[name=td_install_date]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();
        saveUpdate(customer_id, 'install_date', input_value, 'input')
    });

    $("#kt_customers_table tbody select[name=td_design_requested]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_design_requested]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('design_requested') : saveUpdate(customer_id, 'design_requested', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_pe_stamp_requested]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_pe_stamp_requested]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('pe_stamp_requested') : saveUpdate(customer_id, 'pe_stamp_requested', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_permit_submitted]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_permit_submitted]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('permit_submitted') : saveUpdate(customer_id, 'permit_submitted', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_permit_approved]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_permit_approved]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('permit_approved') : saveUpdate(customer_id, 'permit_approved', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_ic_submitted]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_ic_submitted]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('ic_submitted') : saveUpdate(customer_id, 'ic_submitted', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_ic_approved]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_ic_approved]").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('ic_approved') : saveUpdate(customer_id, 'ic_approved', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_install_confirmed]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_install_confirmed").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('install_confirmed') : saveUpdate(customer_id, 'install_confirmed', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_install_complete]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_install_complete").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('install_complete') : saveUpdate(customer_id, 'install_complete', input_value, 'selection')
    });

    $("#kt_customers_table tbody select[name=td_equipment_ordered]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_equipment_ordered").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('equipment_ordered') : saveUpdate(customer_id, 'equipment_ordered', input_value, 'selection')
    });

    $("#kt_customers_table tbody input[name=td_contract_value]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_contract_value]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'contract_value', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_ahj]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_ahj]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'ahj', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_ahj_phone]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_ahj_phone]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'ahj_phone', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_permit_plan_number]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_permit_plan_number]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'permit_plan_number', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_permit_notes]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_permit_notes]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'permit_notes', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_utility_and_esid]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_utility_and_esid]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'utility_and_esid', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody select[name=td_battery]").change(function (ev) {
        const current_row = $(this).closest("tr");
        const input_value = current_row.find("select[name=td_battery").val();
        const customer_id = current_row.find("input[name=id_customer]").val();

        input_value == "Add" ? addOption('battery') : saveUpdate(customer_id, 'battery', input_value, 'selection')
    });

    $("#kt_customers_table tbody input[name=td_kw]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_kw]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'kw', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_project_cost]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_project_cost]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'project_cost', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_their_company_cost]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_their_company_cost]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'their_company_cost', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_their_company_mo]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_their_company_mo]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'their_company_mo', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_commission_percentage]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_commission_percentage]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'commission_percentage', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_calc_red]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_calc_red]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'calc_red', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_adders]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_adders]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'adders', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_bank_funded]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_bank_funded]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'bank_funded', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_design_fee]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_design_fee]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'design_fee', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_paid_to_manager]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_paid_to_manager]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'paid_to_manager', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_paid_to_closer]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_paid_to_closer]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'paid_to_closer', input_value, 'input')
        }
    });

    $("#kt_customers_table tbody input[name=td_paid_to_setter]").on("keyup change", function (ev) {
        if (ev.keyCode == 13) {
            const current_row = $(this).closest("tr");
            const input_value = current_row.find("input[name=td_paid_to_setter]").val();
            const customer_id = current_row.find("input[name=id_customer]").val();
            saveUpdate(customer_id, 'paid_to_setter', input_value, 'input')
        }
    });


    const addOption = (field_option_name) => {
        $('input[name=field_option_name]').val(field_option_name)
        $('#addOptionModal').modal('toggle');
    }

    const saveUpdate = (customer_id, field, input_value, field_type) => {
        $.ajax({
             type: 'POST',
             url: '/customers/update/',
             data: {'id': customer_id, 'field': field, 'value': input_value, 'csrfmiddlewaretoken': $('input[name=csrfmiddlewaretoken]').val(), 'field_type': field_type},
             success: (result) => {
                 const statusMsg = result['statusMsg'];
                 toastr.options = {
                     closeButton: false,
                     debug: false,
                     newestOnTop: false,
                     progressBar: false,
                     positionClass: "toastr-top-right",
                     preventDuplicates: false,
                     onclick: null,
                     showDuration: "300",
                     hideDuration: "1000",
                     timeOut: "5000",
                     extendedTimeOut: "1000",
                     showEasing: "swing",
                     hideEasing: "linear",
                     showMethod: "fadeIn",
                     hideMethod: "fadeOut",
                 };
                 toastr.success(`${statusMsg} Updated`);
             },
             error: (result) => {
                 const statusMsg = result['responseJSON']['statusMsg'];
                 toastr.options = {
                     closeButton: false,
                     debug: false,
                     newestOnTop: false,
                     progressBar: false,
                     positionClass: "toastr-top-right",
                     preventDuplicates: false,
                     onclick: null,
                     showDuration: "300",
                     hideDuration: "1000",
                     timeOut: "5000",
                     extendedTimeOut: "1000",
                     showEasing: "swing",
                     hideEasing: "linear",
                     showMethod: "fadeIn",
                     hideMethod: "fadeOut",
                 };
                 toastr.error(`${statusMsg}`);
             }
        });
    }

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

    $("#addOptionModal").on("hidden.bs.modal", function () {
        location.reload(true)
    });

    $('#addOptionForm').on('submit', (e) => {
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
                const formData = $('#addOptionForm').serialize();
                $.ajax({
                    type: 'POST',
                    data: formData,
                    url: '/customers/add-option/',
                    success: (result) => {
                        const statusMsg = result['statusMsg'];
                         toastr.options = {
                             closeButton: false,
                             debug: false,
                             newestOnTop: false,
                             progressBar: false,
                             positionClass: "toastr-top-right",
                             preventDuplicates: false,
                             onclick: null,
                             showDuration: "300",
                             hideDuration: "1000",
                             timeOut: "5000",
                             extendedTimeOut: "1000",
                             showEasing: "swing",
                             hideEasing: "linear",
                             showMethod: "fadeIn",
                             hideMethod: "fadeOut",
                         };
                         toastr.success(`${statusMsg}`);
                    },
                    error: (result) => {
                     const statusMsg = result['responseJSON']['statusMsg'];
                     toastr.options = {
                         closeButton: false,
                         debug: false,
                         newestOnTop: false,
                         progressBar: false,
                         positionClass: "toastr-top-right",
                         preventDuplicates: false,
                         onclick: null,
                         showDuration: "300",
                         hideDuration: "1000",
                         timeOut: "5000",
                         extendedTimeOut: "1000",
                         showEasing: "swing",
                         hideEasing: "linear",
                         showMethod: "fadeIn",
                         hideMethod: "fadeOut",
                     };
                     toastr.error(`${statusMsg}`);
                 }

                });
            }
        })
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
                 formData.append("sold_with", $(e.target).find("select[name=sold_with]").val())
                 formData.append("ss", $(e.target).find("input[name=ss]").val())
                 formData.append("finance_company", $(e.target).find("input[name=finance_company]").val())
                 formData.append("number_of_panels", $(e.target).find("input[name=number_of_panels]").val())
                 formData.append("contract_signed_date", $(e.target).find("input[name=contract_signed_date]").val())
                 formData.append("battery", $(e.target).find("select[name=battery]").val())
                 formData.append("kw", $(e.target).find("input[name=kw]").val())
                 formData.append("project_cost", $(e.target).find("input[name=project_cost]").val())
                 formData.append("manager", $(e.target).find("select[name=manager]").val())
                 formData.append("setter", $(e.target).find("select[name=setter]").val())
                 formData.append("closer", $(e.target).find("select[name=closer]").val())
                 formData.append("contractor", $(e.target).find("select[name=contractor]").val())
                 formData.append("permit_specialist", $(e.target).find("select[name=permit_specialist]").val())
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
                             $(e.target).find("select[name=sold_with]").val('').trigger('change')
                             $(e.target).find("select[name=battery]").val('').trigger('change')
                             $(e.target).find("select[name=manager]").val('').trigger('change')
                             $(e.target).find("select[name=setter]").val('').trigger('change')
                             $(e.target).find("select[name=closer]").val('').trigger('change')
                             $(e.target).find("select[name=contractor]").val('').trigger('change')
                             $(e.target).find("select[name=permit_specialist]").val('').trigger('change')
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
