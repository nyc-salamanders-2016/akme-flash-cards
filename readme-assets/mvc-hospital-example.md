# MVC Example

### Patient Model
```ruby
class Patient
  attr_reader :date_of_birth, :medical_records_number, :name
  
  def initialize(args = {})
    @date_of_birth = args[:date_of_birth]
    @medical_records_number = args[:medical_records_number]
    @name = args[:name]
  end
  
  alias_method :mrn, :medical_records_number
  alias_method :dob, :date_of_birth
end
```


### Patient View
```ruby
module PatientView  
  def self.show(patient)
    "#{patient.mrn} - #{patient.name} (DOB: #{format_dob(patient.dob)})"
  end
  
  private
  def self.format_dob(date)
  	date.strftime("%m/%d/%Y")
  end
end
```


### Hospital Model
```ruby
class Hospital
  attr_reader :patients
  
  def initialize(name, patients = [])
    @name = name
    @patients = patients
  end
  
  def find_patient_by_name(name)
    patients.find { |patient| patient.name == name }
  end
  
  def patient_count
    patients.count
  end
end
```


### Hospital View
```ruby
module HospitalView
  def self.show(hospital)
    "#{hospital.name}\n#{hospital.patient_count} patients admitted."
  end
end
```


### Hospital Application Controller
```ruby
class Controller
  def initialize(hospital)
    @hospital = hospital
  end
  
  def run(command, option = nil)
    case command
    when "hospital" then show_hospital
    when "patient" then show_patient(option)
    end
  end
  
  private
  attr_reader :hospital
  
  def show_hospital
    HospitalView.show(hospital)
  end
  
  def show_patient(search_name)
    patient = hospital.find_patient_by_name(search_name)
    if patient
      PatientView.show(patient)
    else
      "Could not find a patient with the name #{search_name}."
    end
  end
end
```
