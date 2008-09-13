module Admin::LookupCodesLoader
  class << self

    def create_default_list
      LookupCode.delete_all
      domain_list = ['Domain', 'Person Title', 'Marital Status',
        'Residential Status', 'Employment Status', "Accident Type","Monthly Time Frames", "Severities", "Daily Time Frames",
        "Traffic Conditions", "Warnings", "Damage", "Insurance Cover", "Insurance Party", "Passenger Location", "Payment Option",
        "Phone Type", "Weather Conditions", "Yes No", "Car Makes", "Insurance Class", "Insurance Companies", "Seating Positions", "Slip Trip", "Pace",
        "Claim Status", "Finance Type", "Occupation"
        ]
      add_codes('Domain',domain_list)

      person_titles = ['Please select'  , 'Miss'  , 'Mr'  , 'Mrs' , 'Ms'  , 'Dr'  , 'Rev' , 'Other' ]
      add_codes('Person Title',person_titles)

      marital_status = ["Please select","Single","Married","Separated","Divorced","Widowed","Living with Partner","Civil Partnership"]
      add_codes('Marital Status',marital_status )

      residential_status = ["Please select","Home Owner","Private Tenant","Housing Association","Council Tenant","MOD","Living With Parents"]
      add_codes('Residential Status', residential_status  )

      employment_status = ["Please select","Employed Part Time","Employed Full Time","Self Employed","Not Working","Retired","Full Time Student"]
      add_codes('Employment Status', employment_status)

      accident_types = ["Please select", "Road Traffic Accident (RTA)","Work Place Incident", "Slip or Trip" ]
      add_codes('Accident Type', accident_types)

      monthly_time_frames = ["Please select", "Less than 1 week", "Less than 1 month", "Less than 3 months", "Less than 6 months", "Less than 12 months", "Over 12 months"]
      add_codes('Monthly Time Frames', monthly_time_frames)

      daily_time_frames = ["Please select", "Immediate", "Within 24 hours", "Within 48 hours", "Within 72 hours", "Within 7 days", "Over 7 days"]
      add_codes('Daily Time Frames', daily_time_frames)

      severities = ["Please select", "Minor", "Medium","Severe", "Life threatening"]
      add_codes('Severities', severities)

      traffic_conditions = ["Please select", "Heavy", "Quiet", "Moderate", "Rush hour"]
      add_codes('Traffic Conditions', traffic_conditions)

      warnings = ["Please select", "Flash lights", "Beep Horn", "Gestured","Other", "None" ]
      add_codes('Warnings', warnings)

      damages  = ["Please select", "Light", "Medium", "Severe", "Potential Write Off", "Definite Write Off"]
      add_codes('Damage', damages)

      insurance_covers = ["Please select", "Third Party", "Third Party Fire & Theft", "Comprehensive"]
      add_codes('Insurance Cover', insurance_covers)

      insurance_parties = ["Please select", "My insurance", "3rd party insurance", "Myself", "Other driver"]
      add_codes('Insurance Party', insurance_parties)

      passenger_locations = ["Please select", "Driver", "Passenger Front Seat", "Passenger Rear Seat"]
      add_codes('Passenger Location', passenger_locations)

      payment_options = ["Please select", "Paid", "Deferred"]
      add_codes('Payment Option', payment_options)

      phone_categories = ['Select phone type','Home','Mobile','Work','Other']
      add_codes('Phone Type',phone_categories)

      weather_conditions = ['Please select','Heavy Rain','Light Rain','Sleet / Snow','Dry', 'Sunny']
      add_codes('Weather Conditions',weather_conditions)

      yes_no = ['Please select','Yes','No']
      add_codes('Yes No',yes_no)

      yes_no = ['Please select','Yes','No', 'Not Sure']
      add_codes('Yes No Not Sure',yes_no)

      vehicle_make = ['Please select','AC','Aixam','Alfa Romeo','Asia','Aston Martin','Audi','Austin','Bentley','BMW','Bristol','Bugatti','Cadillac','Caterham','Chevrolet','Chrysler','Citroen','Coleman Milne','Corvette','Dacia','Daewoo','Daihatsu','Daimler','Datsun','De Tomaso','Dodge','Ferrari','Fiat','Ford','FSO','GMC','HMC','Honda','Hummer','Hyundai','Isuzu','Jaguar','Jeep','Kia','Koenigsegg','Lada','Lamborghini','Lancia','Land Rover','LDV','Lexus','Ligier','Lincoln','Lonsdale','Lotus','MacNeillie','Marcos','Marlin','Maserati','Maybach','Mazda','Mercedes-Benz','MG','Microcar','MINI','Mitsubishi','Morgan','Morris','Nissan','Noble','Opel','Panther','Perodua','Peugeot','Pontiac','Porsche','Proton','Reliant','Renault','Rolls-Royce','Rover','Saab','Sao','SEAT','Sebring','Simca','Skoda','Smart','Spectre','Ssangyong','Subaru','Suzuki','Talbot','Tata','Toyota','Triumph','TVR','Vauxhall','Venturi','Volkswagen','Volvo','Westfield','Yugo']
      add_codes('Car Makes', vehicle_make)

      insurance_cover = ['Please Select', 'Comprehensive', '3rd Party', 'Not Sure', 'Not Insured']
      add_codes('Insurance Class',insurance_cover)

      insurance_company = ['Please Select', 'None', 'AA', 'Admiral', 'Allianz Cornhill', 'Ansvar','Auto Direct','Avon','Axa','BDML','Bell Direct','Churchill','CIS','Corinthian','Crowe','Diamond','Direct Line','Doric','Eagle Star','Ecclesiastical','Eclipse','Egg','Elephant.co.uk','Ensign','Enterprise','Esure','Folgate','Fortis','Groupama','Hastings Direct','Highway','Hill House Hammond','Holdsure','Independant','Insure.co.uk','IYM.Com','KGM','Kwik-Fit','Legal & General','Link','Lloyds of London','LloydsTSB','MMA','MoreThan','Municipal Mutual','N. Farmers Union','Nationwide','N.I.G.','Norwich Union','Pearl','Privilege Insurance','Provident','Prudential','Quinn Direct','RAC','Rapid Insure','Red Star','Regency','Royal Sun Alliance','Sabre','Saga','Service','Sheilas Wheels','Swift cover','Swinton','Tesco','Unknown/Other','yesinsurance.co.uk','Virgin','Zurich','Other']
      add_codes('Insurance Companies',insurance_company)

      seating_positions = ['Please select'  , 'Driver'  , 'Passenger' ]
      add_codes('Seating Positions',seating_positions)

      slip_or_trip = ['Please select', 'Slip', 'Trip']
      add_codes('Slip Trip', slip_or_trip)

      paces = ['Please select', 'Walking', 'Running' ]
      add_codes('Pace', paces)

      claim_status = ['Please select', 'Refund received', 'Refund refused', 'On hold', 'Not sure', ]
      add_codes('Claim Status', claim_status)

      finance_types = ['Please select', 'Credit card','Unsecured Loan','Mortgage','Car Finance','Furniture Finance','Electrical Goods Finance','Catalogue','Other Financial Product','Secured Loan']
      add_codes('Finance Type', finance_types)
      
      occupations = ["Please select","Admininstrator","Apprentice","Barrister","Builder","Bus Driver","Carer",
        "Case Assistant","Child Minder","Civil Servant","Cleaner","Clerical","Clerk","Decorator",
        "Director","Disabled","Doctor","Drivers Mate","Electrician","Financial Advisor","Gardener",
        "Grounds Man","Hairdresser","HM Forces","Home Maker","IT","Judge","Kitchen Fitter","Labour",
        "Lecturer","Local Government","Manager","Milkman","Not Working","Nursery Nurse","Other","PA",
        "Painter","Plaster","Plumber","Police","Porter","Receptionist","Registered Nurse","Roofer",
        "Salesperson","Shop Assistant","Solicitor","Supervisor","Taxi Driver","Teacher",
        "Teaching Assistant","Team Leader","Telephonist","Tradesman","Typist","Unskilled","Window Fitter"]
      add_codes('Occupation', occupations)
      

      nil
    end


    private
    def add_codes(domain_name, value_list)
      for i in (0...value_list.length)
        LookupCode.create!( :domain =>  domain_name , :lookup_id => i , :value => value_list[i] )
      end
    end
  end
end
