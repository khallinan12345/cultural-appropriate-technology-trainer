#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Starting Cultural Technology Assistant...${NC}"

# Kill processes on all potentially used ports
echo -e "${GREEN}🔧 Cleaning up ports...${NC}"
for port in 3000 3001 3002 3003; do
    if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null ; then
        echo -e "${RED}Killing process on port $port${NC}"
        kill -9 $(lsof -ti:$port) 2>/dev/null
    fi
done

# Wait a moment for ports to be freed
sleep 1

# Check if .env file exists
if [ ! -f .env ]; then
    echo -e "${RED}⚠️  Warning: .env file not found!${NC}"
    echo -e "${YELLOW}Creating a template .env file...${NC}"
    echo "OPENAI_API_KEY=your_openai_api_key_here" > .env
fi

# Start the application
echo -e "${GREEN}🎉 Starting application...${NC}"
echo -e "${YELLOW}Server will run on port 3001${NC}"
echo -e "${YELLOW}Client will run on port 3000${NC}"
npm start