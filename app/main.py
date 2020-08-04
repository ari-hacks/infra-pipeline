from fastapi import APIRouter,Depends, FastAPI, Header, HTTPException
from .api.routers import users, root

app = FastAPI(
    title="FastApi Skeleton",
    description="A Boilerplate FastApi project",
    version="1.0",
)

router = APIRouter()


app.include_router(root.router)
app.include_router(users.router, prefix="/users")
