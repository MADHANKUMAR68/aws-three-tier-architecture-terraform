
#!/bin/bash

echo "Destroying Infrastructure..."
cd terraform
terraform destroy -auto-approve

echo "Infrastructure destroyed."
