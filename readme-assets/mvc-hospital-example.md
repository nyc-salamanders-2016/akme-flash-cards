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
class PatientView
  def initialize(patient)
    @patient = patient
  end
  
  def render
    "#{patient.mrn} - #{patient.name} (DOB: #{format_dob(patient.dob)})"
  end
  
  private
  attr_reader :patient
  
  def format_dob(date)
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
class HospitalView
  attr_reader :hospital
  
  def initialize(hospital)
    @hospital = hospital
  end
  
  def render
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
    view = HospitalView.new(hospital)
    view.render
  end
  
  def show_patient(search_name)
    patient = hospital.find_patient_by_name(search_name)
    if patient
      view = PatientView.new(patient)
      view.render
    else
      "Could not find a patient with the name #{search_name}."
    end
  end
end
```
