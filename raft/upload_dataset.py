import datasets
import os
from huggingface_hub import upload_file


repo = "isaacchung/hotpotqa-dev-raft-subset"

## Remember to remove all the `Here is an example question` examples.
ds = datasets.load_dataset('json', data_files='/home/isaacchung/work/gorilla/data/output/output.chat.jsonl')

ds = ds['train'].train_test_split(test_size=0.2)

for split, dset in ds.items():
    save_path = f"{split}.jsonl"
    dset.to_json(save_path)
    upload_file(
        path_or_fileobj=save_path,
        path_in_repo=save_path,
        repo_id=repo,
        repo_type="dataset",
    )
    os.system(f"rm {save_path}")
