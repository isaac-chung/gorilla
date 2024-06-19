pip install -r /home/isaacchung/work/gorilla/raft/requirements.txt

python3 raft.py \
    --datapath "/home/isaacchung/work/gorilla/data/hotpot_dev_fullwiki_v1.json" \
    --output "/home/isaacchung/work/gorilla/data/output" \
    --distractors 3 \
    --doctype json \
    --chunk_size 512 \
    --questions 1 \
    --fast \
    --openai_key $OPENAI_KEY


python3 format.py --input /home/isaacchung/work/gorilla/data/output/data-00000-of-00001.arrow --output /home/isaacchung/work/gorilla/data/output/output.chat.jsonl --output-format chat
python3 format.py --input /home/isaacchung/work/gorilla/data/output/data-00000-of-00001.arrow --output /home/isaacchung/work/gorilla/data/output/output.completion.jsonl --output-format completion

