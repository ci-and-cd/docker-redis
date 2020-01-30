
export REDIS_PASS="redis_pass"

docker-compose -f docker-compose_redis-cluster.yml down -v

read -p "Do you want clear data: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    find data/cluster ! -name '.gitignore' -type f -exec rm -rf {} +
fi

docker-compose -f docker-compose_redis-cluster.yml up -d
docker-compose -f docker-compose_redis-cluster.yml logs -f
