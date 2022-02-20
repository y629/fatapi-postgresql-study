from sqlalchemy import Boolean, Column, Integer, String, create_engine
from sqlalchemy.ext.declarative import declarative_base
from configurations import DBConfigurations

engine = create_engine(
    DBConfigurations.sql_alchemy_database_url,
    encoding="utf-8",
    pool_recycle=3600,
    echo=True
)

Base = declarative_base()

# Todoテーブルの定義
class Todo(Base):
    __tablename__ = 'todos'
    id = Column('id', Integer, primary_key = True)
    title = Column('title', String(200))
    done = Column('done', Boolean, default=False)

# テーブル作成
Base.metadata.create_all(bind=engine, checkfirst=True)