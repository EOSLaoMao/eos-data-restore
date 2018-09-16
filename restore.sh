#!/bin/bash
echo "$(date '+%d/%m/%Y %H:%M:%S') start restore"
echo "----------------------------------------------"
BACKUP_NAME=`pitreos list -s $BACKUP_PATH/$BACKUP_DATE  | sed "3q;d" | awk '{print $2}'`

pitreos restore $BACKUP_NAME $RESTORE_PATH -c -s $BACKUP_PATH/$BACKUP_DATE


rm -rf $EOS_DATA_DIR/blocks $EOS_DATA_DIR/state
mv $RESTORE_PATH/blocks  $EOS_DATA_DIR/blocks
mv $RESTORE_PATH/state   $EOS_DATA_DIR/state

rm -rf $RESTORE_PATH
