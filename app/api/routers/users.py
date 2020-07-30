from fastapi import APIRouter, Request, Response, Body, HTTPException,Header
from fastapi.responses import PlainTextResponse


router = APIRouter()

@router.get("/health-check", status_code=200)
async def health():
    return {"Message":'healthy user endpoint'}