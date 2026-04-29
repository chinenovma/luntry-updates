set -- image:test
mkdir reports_final
for image in "$@"; do
  COMPLIANCE_IMAGE_FULL_REF="$image" python3.13 scan.py
  cp reports/* reports_final
done
