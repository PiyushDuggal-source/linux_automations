import click
import os

@click.command()
def commit():
    """Commit changes."""
    click.echo("Committing changes...")


@click.command()
def push():
    """Push changes to a remote repository."""
    click.echo("Pushing changes...")


@click.group()
def cli():
    os.system("ls")


cli.add_command(commit)
cli.add_command(push)

if __name__ == "__main__":
    cli()
