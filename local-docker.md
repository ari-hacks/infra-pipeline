### Running locally and with docker  

1. Clone this repository and `cd` into it 
   ```BASH
    → git clone https://github.com/ari-hacks/infra-pipeline.git

    → cd infra-pipeline
    ```

    ```BASH 
    → pytest
    ```
2. Pipenv dependency management 
   
    ```BASH
      #run pipenv 
    → pipenv shell
    ```
    ```BASH
      #install dependencies  
    → pipenv install
    ```
3. Run application locally
   ```
   uvicorn app.main:app --reload  
   ```
4. [Install & Run in docker](https://hub.docker.com/) 
5. Build Docker Image 
    ```bash
    ➜ docker build -t app .
    ```
6. Start Docker container 
    ```bash
    ➜ docker run -d --name infra-pipeline-container -p 5000:5000 app
    ```
7. Run the application
   ```bash 
    Uvicorn running on http://0.0.0.0:5000/users/health-check 
    #or 
    http://localhost:5000/users/health-check
   ```
8. Check the logs 
   ```bash 
   ➜ docker container logs -f infra-pipeline-container
   ```

    [🔙](https://github.com/ari-hacks/infra-pipeline) README