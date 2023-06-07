# Model-level descriptions
{% docs stg_procedures %}
An action that is or was performed on or for a patient, practitioner, device, organization, or
location. For example, this can be a physical intervention on a patient like an operation, or less invasive like
long term services, counseling, or hypnotherapy. This can be a quality or safety inspection for a location,
organization, or device. This can be an accreditation procedure on a practitioner for licensing.

source: https://www.hl7.org/fhir/procedure.html
{% enddocs %}

{% docs stg_claims %}
The Claim is used by providers and payors, insurers, to exchange the financial information, and
supporting clinical information, regarding the provision of health care services with payors and for reporting to
regulatory bodies and firms which provide data analytics. The primary uses of this resource is to support eClaims,
the exchange of information relating to the proposed or actual provision of healthcare-related goods and services
for patients to their benefit payors, insurers and national health programs, for treatment payment planning and
reimbursement.

source: https://www.hl7.org/fhir/claim.html
{% enddocs %}

# IDs

{% docs claim_id %}
The unique identifier of the claim.
{% enddocs %}

{% docs organization_id %}
The unique identifier of the organization.
{% enddocs %}

{% docs encounter_id %}
The unique identifier of the encounter.
{% enddocs %}

{% docs condition_id %}
The unique identifier of the condition.
{% enddocs %}

{% docs medication_request_id %}
The unique identifier of the medication request.
{% enddocs %}

{% docs patient_id %}
The unique identifier of the patient.
{% enddocs %}

{% docs procedure_id %}
The unique identifier of the procedure.
{% enddocs %}

# Procedures

{% docs procedure_started_at %}
When the procedure started.
{% enddocs %}

{% docs procedure_ended_at %}
When the procedure ended.
{% enddocs %}

{% docs procedure_code %}
The type of procedure (e.g., biopsy, intubation, etc.).
{% enddocs %}

# Claims

{% docs claim_status %}
The claim status [active | cancelled | draft | entered-in-error].
{% enddocs %}

{% docs claim_total_value %}
The total claim cost (e.g. item cost, tax, scaling factor, etc.).
{% enddocs %}
