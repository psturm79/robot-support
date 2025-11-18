from loguru import logger
logger.add("robot_support.log", rotation="10 MB")
__all__ = ["logger"]
