import React from "react";

function Icon() {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="32"
      height="32"
      fill="currentColor"
      viewBox="0 0 256 256"
    >
      <path d="M192 32H64a32 32 0 00-32 32v128a32 32 0 0032 32h128a32 32 0 0032-32V64a32 32 0 00-32-32zM92 176a12 12 0 1112-12 12 12 0 01-12 12zm0-72a12 12 0 1112-12 12 12 0 01-12 12zm36 36a12 12 0 1112-12 12 12 0 01-12 12zm36 36a12 12 0 1112-12 12 12 0 01-12 12zm0-72a12 12 0 1112-12 12 12 0 01-12 12z"></path>
    </svg>
  );
}

export default React.memo(Icon);