Sports Highlights Ingestion & Processing Pipeline
This project automates the fetching, downloading, processing, and saving of sports highlight videos using AWS and Docker. All AWS resources are provisioned with Terraform.

Features
Fetches sports highlights from RapidAPI (supports configurable leagues and dates)

Downloads a random video and uploads it to S3

Processes videos with AWS MediaConvert (outputs multiple renditions)

Stores highlight metadata and logs in S3

Dockerized pipeline run on an EC2 instance, scheduled via EventBridge

Infrastructure as Code using Terraform

Repository structure
.
├── Dockerfile
├── main.tf
├── mediaconvert_process.py
├── outputs.tf
├── pipeline.py
├── providers.tf
├── requirements.txt
├── terraform.tfstate
├── terraform.tfstate.backup
├── variables.tf
└── venv/


Prerequisites
AWS account with sufficient permissions

RapidAPI account + Sports Highlights API key

Docker

AWS CLI

Python 3

Terraform

1. Clone the Repository

bash
git clone git@github.com:katepalliyaswanth-02/sports-ingestion.git
cd sports-ingestion


2. Configure Environment
Create a .env file (not committed to git) with your API keys and config:

text
RAPIDAPI_KEY=your_rapidapi_key
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
S3_METADATA_BUCKET=sports-highlights-metadata
S3_VIDEOS_BUCKET=sports-highlights-videos
S3_LOGS_BUCKET=sports-highlights-logs

3. Install Python Dependencies
Use a virtual environment for dependencies:

bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt


4. Build Docker Image
bash
docker build -t sports-ingestion-pipeline .

5. Provision AWS Resources with Terraform
1.Initialize Terraform:
bash
terraform init

2.Review and Apply Plan:
bash
terraform plan
terraform apply

6. Deploy & Run the Pipeline
The EC2 instance is set up by Terraform to pull and run your Docker container.

EventBridge automatically triggers the workflow based on the schedule you defined 


7. Check Outputs
S3 Buckets contain:

highlights/{league}/{date}/highlights.json

incoming/ for raw video

processed/{league}/{date}/ for processed outputs

logs/{date}/pipeline.log for logs

8. Cleaning Up
To remove all resources:

bash
terraform destroy

Troubleshooting
Check S3 logs for pipeline errors.

Ensure IAM permissions cover EC2, S3, MediaConvert

Verify environment variables are set in .env.


<img width="1174" height="469" alt="image" src="https://github.com/user-attachments/assets/49c615e4-f250-4ecf-9a19-25fe79053ea3" />


<img width="1918" height="944" alt="image" src="https://github.com/user-attachments/assets/ac4a7824-3a77-4388-ae74-ff54df438f6a" />

















# sports-ingestion
<img width="1136" height="789" alt="image" src="https://github.com/user-attachments/assets/314c4674-eb09-4aa0-8cfd-39d2a36a871d" />
