addEducation = ()=>{

let divElements = document.querySelectorAll('.addMultiEducation');
let index = divElements.length;
console.log(index);

// Get a reference to the other div
const allEducationDiv = document.getElementById("allEducationDiv");

// Create a new div to hold the education form
const educationDiv = document.createElement("div");
educationDiv.classList.add("addMultiEducation");

//create child div
const childDivForCollege = document.createElement("div");


// Create the input field for college name
const collegeInput = document.createElement("input");
collegeInput.classList.add("editDataInputLong");
collegeInput.setAttribute("type", "text");
collegeInput.setAttribute("name", `studentData.education[${index}].college`);

// Create the label for the college name input field
const collegeLabel = document.createElement("p");
collegeLabel.classList.add("editDataTagP");
collegeLabel.textContent = "College name";

// Add the college name input field and label to the education div
childDivForCollege.appendChild(collegeLabel);
childDivForCollege.appendChild(collegeInput);
educationDiv.appendChild(childDivForCollege);

// Create the Degree and Field div to hold degree and field input fields
const degreeAndFieldDiv = document.createElement("div");
degreeAndFieldDiv.classList.add("DegreeAndField", "profileFlexDiv");

//create child div
const childDivForDegree = document.createElement("div");

// Create the input field for degree
const degreeInput = document.createElement("input");
degreeInput.classList.add("editDataInput");
degreeInput.setAttribute("type", "text");
degreeInput.setAttribute("name", `studentData.education[${index}].degree`);

// Create the label for the degree input field
const degreeLabel = document.createElement("p");
degreeLabel.classList.add("editDataTagP");
degreeLabel.textContent = "Degree";

// Add the degree input field and label to the Degree and Field div
childDivForDegree.appendChild(degreeLabel);
childDivForDegree.appendChild(degreeInput);
degreeAndFieldDiv.appendChild(childDivForDegree);

// Create the input field for field
const fieldInput = document.createElement("input");
fieldInput.classList.add("editDataInput");
fieldInput.setAttribute("type", "text");
fieldInput.setAttribute("name", `studentData.education[${index}].field`);

// Create the label for the field input field
const fieldLabel = document.createElement("p");
fieldLabel.classList.add("editDataTagP");
fieldLabel.textContent = "Field";


//create child div
const childDivForField = document.createElement("div");

// Add the field input field and label to the Degree and Field div
childDivForField.appendChild(fieldLabel);
childDivForField.appendChild(fieldInput);
degreeAndFieldDiv.appendChild(childDivForField);

// Add the Degree and Field div to the education div
educationDiv.appendChild(degreeAndFieldDiv);

// Create the Passout and Mark div to hold passout year and marks input fields
const passoutAndMarkDiv = document.createElement("div");
passoutAndMarkDiv.classList.add("passoutAndMark", "profileFlexDiv");

// Create the input field for passout year
const passoutInput = document.createElement("input");
passoutInput.classList.add("editDataInput");
passoutInput.setAttribute("type", "text");
passoutInput.setAttribute("name", `studentData.education[${index}].passout`);

// Create the label for the passout year input field
const passoutLabel = document.createElement("p");
passoutLabel.classList.add("editDataTagP");
passoutLabel.textContent = "Passout Year";

//create child div
const childDivForPassout = document.createElement("div");

// Add the passout year input field and label to the Passout and Mark div
childDivForPassout.appendChild(passoutLabel);
childDivForPassout.appendChild(passoutInput);
passoutAndMarkDiv.appendChild(childDivForPassout);

// Create the input field for marks
const marksInput = document.createElement("input");
marksInput.classList.add("editDataInput");
marksInput.setAttribute("type", "text");
marksInput.setAttribute("name", `studentData.education[${index}].mark`);

// Create the label for the marks input field
const marksLabel = document.createElement("p");
marksLabel.classList.add("editDataTagP");
marksLabel.textContent = "Marks";

//create child div
const childDivForMark = document.createElement("div");

// Add the marks input field and label to the Passout and Mark div
childDivForMark.appendChild(marksLabel);
childDivForMark.appendChild(marksInput);
passoutAndMarkDiv.appendChild(childDivForMark);

// Add the Passout and Mark div to the education div
educationDiv.appendChild(passoutAndMarkDiv);

// Create the horizontal line
const hr = document.createElement("hr");

// Add the horizontal line to the education div
educationDiv.appendChild(hr);

// Append the education div to the other div
allEducationDiv.appendChild(educationDiv);

}

// addEducation = ()=>{
//   console.log("in fun")
//   const allEducationDiv = document.getElementById("allEducationDiv");
// const addMultiEducation = document.querySelector(".addMultiEducation");

// console.log(addMultiEducation)
// allEducationDiv.appendChild(addMultiEducation);

// }




// add new skills
addSkills = ()=>{
  // Create a new div element with class "addMultiSkill"
const addMultiSkill = document.createElement("div");
addMultiSkill.classList.add("addMultiSkill");

// Create a new input element with class "editDataInputLong"
const newInput = document.createElement("input");
newInput.classList.add("editDataInputLong");
newInput.setAttribute("type", "text");
newInput.setAttribute("name", "studentData.skills");

// Create a new hr element
const newHr = document.createElement("hr");

// Append the input and hr elements to the new div element
addMultiSkill.appendChild(newInput);
addMultiSkill.appendChild(newHr);

// Get a reference to the other div element and append the new div to it
const allSkills = document.getElementById("allSkills");
allSkills.appendChild(addMultiSkill);

}



// submit form

submitForm = ()=>{
  document.getElementById("profileForm").submit();
}
