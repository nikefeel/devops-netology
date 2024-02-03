import sentry_sdk

sentry_sdk.init(
    dsn="https://f8ac6cb2f123e7a54837f87aab8d0df1@o4506681986514944.ingest.sentry.io/4506682013646848",
    environment="development",
    release="1.0"
)
if __name__ == "__main__":
    division_zero = 1/0