# Model-level descriptions
{% docs stg_claims %}
The Claim is used by providers and payors, insurers, to exchange the financial
information, and supporting clinical information, regarding the provision of
health care services with payors and for reporting to regulatory bodies and
firms which provide data analytics. The primary uses of this resource is to
support eClaims, the exchange of information relating to the proposed or actual
provision of healthcare-related goods and services for patients to their
benefit payors, insurers and national health programs, for treatment payment
planning and reimbursement.

source: https://www.hl7.org/fhir/claim.html
{% enddocs %}

{% docs stg_conditions %}
A clinical condition, problem, diagnosis, or other event, situation, issue,
or clinical concept that has risen to a level of concern.

source: https://www.hl7.org/fhir/condition.html
{% enddocs %}

{% docs stg_encounters %}
An interaction between a patient and healthcare provider(s) for the purpose of
providing healthcare service(s) or assessing the health status of a patient.
Encounter is primarily used to record information about the actual activities
that occurred, where Appointment is used to record planned activities.

source: https://www.hl7.org/fhir/encounter.html
{% enddocs %}

{% docs stg_organizations %}
A formally or informally recognized grouping of people or organizations formed
for the purpose of achieving some form of collective action. Includes
companies, institutions, corporations, departments, community groups, healthcare
practice groups, payer/insurer, etc.

source: https://www.hl7.org/fhir/organization.html
{% enddocs %}

{% docs stg_patients %}
Demographics and other administrative information about an individual or
animal receiving care or other health-related services.

source: https://www.hl7.org/fhir/patient.html
{% enddocs %}

{% docs stg_procedures %}
An action that is or was performed on or for a patient, practitioner, device,
organization, or  location. For example, this can be a physical intervention on
a patient like an operation, or less invasive like long term services,
counseling, or hypnotherapy. This can be a quality or safety inspection for a
location, organization, or device. This can be an accreditation procedure on a
practitioner for licensing.

source: https://www.hl7.org/fhir/procedure.html
{% enddocs %}

# Column-Level Descriptions

## Claims

{% docs claim_id %}
The unique identifier of the claim.
{% enddocs %}

{% docs claim_status %}
The claim status [active | cancelled | draft | entered-in-error].
{% enddocs %}

{% docs claim_total_value %}
The total claim cost (e.g. item cost, tax, scaling factor, etc.).
{% enddocs %}

{% docs claim_medication_request_id %}
The unique identifier of the medication request.
{% enddocs %}

{% docs claim_billable_period_started_at %}
Starting timestamp of the period for which charges are being submitted.
{% enddocs %}

{% docs claim_billable_period_ended_at %}
Ending timestamp of the period for which charges are being submitted.
{% enddocs %}

## Conditions

{% docs condition_id %}
The unique identifier of the condition.
{% enddocs %}

{% docs condition_code %}
Identification of the condition, problem or diagnosis.
{% enddocs %}

{% docs condition_display %}
Description of the condition displayed.
{% enddocs %}

{% docs condition_text %}
Alternative text for condition_display.
{% enddocs %}

{% docs condition_onset_at %}
Estimated or actual date or date-time the condition began, in the opinion of
the clinician.
{% enddocs %}

{% docs condition_abatement_at %}
The date or estimated datetime that the condition resolved or went into
remission. This is called "abatement" because of the many overloaded
connotations associated with "remission" or "resolution" - Some conditions,
such as chronic conditions, are never really resolved, but they can abate.
{% enddocs %}

## Encounters

{% docs encounter_id %}
The unique identifier of the encounter.
{% enddocs %}

{% docs encounter_started_at %}
The start timestamp for each encounter record.
{% enddocs %}

{% docs encounter_ended_at %}
The end timestamp for each encounter record.
{% enddocs %}

## Organizations

{% docs organization_id %}
The unique identifier of the organization.
{% enddocs %}

{% docs organization_name %}
The name of the organization.
{% enddocs %}

{% docs organization_type %}
The type of organization (e.g., hospital, clinic, pharmacy, laboratory).
{% enddocs %}

{% docs organization_address %}
The address of the organization.
{% enddocs %}

{% docs organization_city %}
City of the organization.
{% enddocs %}

{% docs organization_state %}
State of the organization.
{% enddocs %}

{% docs organization_country %}
Country of the organization.
{% enddocs %}

{% docs organization_postal_code %}
Postal code of the organization.
{% enddocs %}

## Patients

{% docs patient_id %}
The unique identifier of the patient.
{% enddocs %}

{% docs patient_gender %}
The patient's gender [male | female | other | unknown].
{% enddocs %}

{% docs patient_birth_date %}
The date of birth for the individual.
{% enddocs %}

{% docs patient_last_name %}
A last name associated with the patient.
{% enddocs %}

{% docs patient_first_name %}
A first name (or given name) associated with the patient.
{% enddocs %}

{% docs patient_name_in_use %}
Whether the name is use is the patient's official name or maiden name.
{% enddocs %}

{% docs patient_deceased_at %}
If the patient is deceased, the time of the patient's decease.
{% enddocs %}

{% docs patient_country %}
The country of residence of this patient.
{% enddocs %}

{% docs patient_state %}
The state of residence of this patient.
{% enddocs %}

{% docs patient_postal_code %}
Postal code associated with this patient.
{% enddocs %}

{% docs patient_city %}
The city of residence of this patient.
{% enddocs %}

{% docs patient_address %}
An address for the individual. Patient may have multiple addresses with
different uses or applicable periods.
{% enddocs %}

## Procedures

{% docs procedure_id %}
The unique identifier of the procedure.
{% enddocs %}

{% docs procedure_started_at %}
When the procedure started.
{% enddocs %}

{% docs procedure_ended_at %}
When the procedure ended.
{% enddocs %}

{% docs procedure_code %}
The type of procedure (e.g., biopsy, intubation, etc.).
{% enddocs %}
