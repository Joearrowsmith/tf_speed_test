docker container rm tf_speed_test_con
docker build . -t tf_speed_test
./docker/start_con.sh
