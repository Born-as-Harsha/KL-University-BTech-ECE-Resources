from django.shortcuts import render, redirect
from .models import *


def employerapphomepage(request):
    return render(request, 'employerapp/employerhomepage.html')


def crudfunction(request):
    employees = EmployeeDetails.objects.all()
    selected_emp = None

    if request.method == "POST":
        read_emp = request.POST.get('read_empid')
        if read_emp:
            selected_emp = EmployeeDetails.objects.filter(
                employee_id=read_emp
            ).first()

    return render(request, 'employerapp/crud.html', {
        'employees': employees,
        'selected_emp': selected_emp
    })

# INSERT DATA
def crud_insert(request):
    if request.method == "POST":

        empid = request.POST.get('empid')
        empname = request.POST.get('empname')
        emploc = request.POST.get('emploc')
        empphone = request.POST.get('empphone')
        empemail = request.POST.get('empemail')

        if not empid:
            return redirect('crudfunction')

        if EmployeeDetails.objects.filter(employee_id=empid).exists():
            return redirect('crudfunction')

        EmployeeDetails.objects.create(
            employee_id=empid,
            employee_name=empname,
            employee_location=emploc,
            employee_phone=empphone,   # ✅ FIXED HERE
            employee_email=empemail
        )

        return redirect('crudfunction')

    return redirect('crudfunction')

def read_employee(request):
    employees = EmployeeDetails.objects.all()
    selected_emp = None
    if request.method == "POST":
        read_emp = request.POST['read_empid']
        selected_emp = EmployeeDetails.objects.filter(employee_id=read_emp).first()
    context = {
        'employees': employees,
        'selected_emp': selected_emp
    }

    return render(request, 'employerapp/crud.html', context)
def update_employee(request):
    employees = EmployeeDetails.objects.all()
    update_emp = None
    message = None

    if request.method == "POST":
        empid = request.POST.get('empid')

        # Fetch employee
        if "fetch" in request.POST:
            update_emp = EmployeeDetails.objects.filter(
                employee_id=empid
            ).first()

        # Update employee
        elif "update" in request.POST:
            update_emp = EmployeeDetails.objects.filter(
                employee_id=empid
            ).first()

            if update_emp:
                update_emp.employee_name = request.POST.get('empname')
                update_emp.employee_location = request.POST.get('emploc')
                update_emp.employee_phone = request.POST.get('empphone')
                update_emp.employee_email = request.POST.get('empemail')
                update_emp.save()
                message = "Employee updated successfully"

    return render(request, 'employerapp/crud.html', {
        "employees": employees,
        "update_emp": update_emp,
        "update_msg": message
    })
def delete_employee(request):
    employees = EmployeeDetails.objects.all()
    message = None

    if request.method == "POST":
        empid = request.POST.get('empid')

        emp = EmployeeDetails.objects.filter(
            employee_id=empid
        ).first()

        if emp:
            emp.delete()
            message = "Employee deleted successfully"

    return render(request, 'employerapp/crud.html', {
        "employees": employees,
        "delete_msg": message
    })