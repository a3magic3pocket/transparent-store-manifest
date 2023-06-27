# transparent-store-manifest
transparent-store-manifest

# 명령어
- ```bash
    # 도커 컨테이너 up
    docker-compose -f ./docker-compose-hot-reload.yml up

    # api 도커 컨테이너, fastapi 서버 실행 명령
    docker exec -it $(docker ps | grep manifest_api | awk -F' ' '{print $1}') bash
    uvicorn main:app --host 0.0.0.0 --port 8000 --reload
    ```