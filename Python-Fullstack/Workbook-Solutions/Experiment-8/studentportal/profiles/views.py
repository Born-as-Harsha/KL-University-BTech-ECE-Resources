from django.shortcuts import render

def student_profile(request):

    student = {
        'name': 'HarshaBardhan',
        'roll': '2',
        'department': 'Electronics and communications engineering',
        'year': '2-Year-Even-Semester',
    }

    return render(request, 'profile.html', {'student': student})


def academic_details(request):

    academics = {
        'cgpa': '9.99',
        'subjects': ['VLSI-DESIGN', 'Operating Systems', 'AIML', 'Network and protocols']
    }

    return render(request, 'academics.html', {'academics': academics})